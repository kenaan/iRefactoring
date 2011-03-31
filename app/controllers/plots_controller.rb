class PlotsController < ApplicationController
  def show
    @complexity_graph = open_flash_chart_object(750,450, project_complexity_plot_path(params[:id]))
    @coverage_graph = open_flash_chart_object(750,450, project_coverage_plot_path(params[:id]))
    render :layout => false
  end
    
  def project_coverage_plot
    project_plot("coverage")
  end

  def project_complexity_plot
    project_plot("complexity")
  end  
  
  private
  def project_plot measurement_name
    project = Project.find(params[:id])

    codes = read_measurement(project, measurement_name)
    max_commit = codes.map {|code| code.commit}.max
    max_measurement_result = codes.map {|code| instance_eval("code.#{measurement_name}")}.max

    scatter = convert_codes_to_scatter_point(codes) do |code|
      new_scatter_point(code.commit, instance_eval("code.#{measurement_name}"), instance_eval("code.#{measurement_name}_tip"))
    end

    graph = Graph.new(project.name, measurement_name, max_commit, max_measurement_result)
    graph.add_element(scatter)
    render :text => graph.to_s
  end
  
  def read_measurement project, measurement_name
    measurement_results = project.read(instance_eval("Measurement::#{measurement_name.capitalize}.new()"))

    measurement_results.each_key{ |code_name|
      update_code_with_commits(code_name, $code_commits){ |commit|
        measurement_results[code_name].commit = commit
      }
    }
    return measurement_results.values
  end

  def update_code_with_commits code_name, commits, &block
    commit = commits[code_name]
    if(!commit.nil?)
      yield(commit)
    end
  end
  
  def convert_codes_to_scatter_point(codes, &block)
    scatter = Scatter.new('#FFD600', 10) 
    scatter.values = codes.map! { |code|
      yield(code)
    }
    scatter.set_dot_style("dot")
    scatter
  end
  
  def new_scatter_point(x, y, tooltip)
    star = Star.new()
    star.set_position(x,y)
    star.size=10
    star.set_tooltip(tooltip)
    star.set_colour('#8B1D55')
    star
  end
end

module OpenFlashChart
  class DotBase < Base
    def set_position(x,y)
      @x = x
      @y = y
    end
  end
end