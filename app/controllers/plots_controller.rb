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

    codes = read(project)
    max_commit = codes.map {|code| code.commit}.max
    max_measurement_result = codes.map {|code| instance_eval("code.#{measurement_name}")}.max

    scatter = convert_codes_to_scatter_point(codes) do |code|
      new_scatter_point(code.commit, instance_eval("code.#{measurement_name}"), code.tip)
    end

    graph = Graph.new(project.name, measurement_name, max_commit, max_measurement_result)
    graph.add_element(scatter)
    render :text => graph.to_s
  end
  
  def read project
    commits = $code_commits
    complexity = project.read(Measurement::Complexity.new)
    coverages = project.read(Measurement::Coverage.new)
    
    complexity.each_key{ |code_name|
      update_code_with_measurement(code_name, commits){ |commit|
        complexity[code_name].commit = commit
      }
      update_code_with_measurement(code_name, coverages){ |code|
        complexity[code_name].coverage = code.coverage
      }
    }
    return complexity.values
  end
  
  def update_code_with_measurement code_name, measurements, &block
    measurement = measurements[code_name]
    if(!measurement.nil?)
      yield(measurement)
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