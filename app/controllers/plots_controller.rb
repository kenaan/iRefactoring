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
  def project_plot measurement
    project = Project.find(params[:id])

    codes = read(project)
    max_commit = codes.map {|code| code.commit}.max
    max_coverage = codes.map {|code| instance_eval("code.#{measurement}")}.max

    scatter = convert_codes_to_scatter_point(codes) do |code|
      new_scatter_point(code.commit, instance_eval("code.#{measurement}"), code.tip)
    end

    chart = new_chart(project.name, measurement, max_commit, max_coverage)
    chart.add_element(scatter)
    render :text => chart.to_s
  end
  
  def new_chart project_name, measurement, max_x, max_y
    graph = Graph.new(project_name, measurement, max_x, max_y)
    graph
  end
  
  def read project
    commits = $code_commits
    complexity = project.read(Measurement::Complexity.new)
    coverages = project.read(Measurement::Coverage.new)
    
    complexity.each_key{ |key|
      commit = commits[key]
      if(!commit.nil?)
        complexity[key].commit = commit
      end
      
      c = coverages[key]
      if(!c.nil?)
        complexity[key].coverage = c.coverage
      end
    }
    return complexity.values
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
    s = Star.new()
    s.set_position(x,y)
    s.size=10
    s.set_tooltip(tooltip)
    s.set_colour('#8B1D55')
    s
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