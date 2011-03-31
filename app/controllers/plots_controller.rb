class PlotsController < ApplicationController
  def show
    project_name = params[:id]
    if(measurement_file_exist? project_name, "complexity")
      @complexity_graph = open_flash_chart_object(750,450, project_complexity_plot_path(project_name))
    else
      @complexity_graph = "Error: project/" + project_name + "/complexity.txt cannot be found"
    end
    
    if(measurement_file_exist? project_name, "coverage")
      @coverage_graph = open_flash_chart_object(750,450, project_coverage_plot_path(project_name))
    else
      @coverage_graph = "Error : project/" + project_name + "/coverage.txt cannot be found"
    end
    
    render :layout => false
  end
    
  def project_coverage_plot
      project_plot("coverage")
  end

  def project_complexity_plot
      project_plot("complexity") 
  end  
  
  private
  
  def measurement_file_exist? project_name, measurement_name
    measurement_parser = instance_eval("Measurement::#{measurement_name.capitalize}.new()")
    measurement_parser.file_exist? project_name
  end
  
  def project_plot measurement_name
    project = Project.find(params[:id])

    codes = project.read_code_measurement(measurement_name)
    max_commit = codes.map {|code| code.commit}.max
    max_measurement_result = codes.map {|code| instance_eval("code.#{measurement_name}")}.max

    scatter = convert_codes_to_scatter_point(codes) do |code|
      new_scatter_point(code.commit, instance_eval("code.#{measurement_name}"), instance_eval("code.#{measurement_name}_tip"))
    end

    graph = Graph.new(project.name, measurement_name, max_commit, max_measurement_result)
    graph.add_element(scatter)
    render :text => graph.to_s
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