class PlotsController < ApplicationController
  def show
    project_name = params[:id]
    ["complexity", "coverage"].each{ |measurement_name|
      if(measurement_file_exist? project_name, measurement_name)
        eval("@#{measurement_name}_graph = 
                open_flash_chart_object(750,450, project_#{measurement_name}_plot_path(project_name))")
      else
        eval("@#{measurement_name}_graph = 'Error: project/' + project_name + '/' + measurement_name + '.txt cannot be found'")
      end
    }    
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
    measurement_parser = eval("Measurement::#{measurement_name.capitalize}.new()")
    measurement_parser.file_exist? project_name
  end
  
  def project_plot measurement_name
    project = Project.find(params[:id])

    codes = project.read_code_measurement(measurement_name)
    max_commit = codes.map {|code| code.commit}.max
    max_measurement_result = codes.map {|code| eval("code.#{measurement_name}")}.max

    graph = Graph.new(project.name, measurement_name, max_commit, max_measurement_result)
    
    scatter = convert_codes_to_scatter_point(codes) do |code|
      new_scatter_point(code.commit, eval("code.#{measurement_name}"), eval("code.#{measurement_name}_tip"))
    end
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