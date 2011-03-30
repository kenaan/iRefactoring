class PlotsController < ApplicationController
  def show
    @complexity_graph = open_flash_chart_object(750,450, project_complexity_plot_path(params[:id]))
    @coverage_graph = open_flash_chart_object(750,450, project_coverage_plot_path(params[:id]))
    render :layout => false
  end

  def project_complexity_plot
    chart = OpenFlashChart.new
    project = Project.find(params[:id])
    add_title(chart, project.name, "Complexity vs. Commits")

    codes = read_complexity(project)
    max_commit = codes.map {|code| code.commit}.max
    max_complexity = codes.map {|code| code.complexity}.max
    
    add_complexity_element_for_project(chart, codes)
    add_axis(chart, max_commit, max_complexity, "Complexity")
    
    render :text => chart.to_s
  end
  
  def project_coverage_plot
    chart = OpenFlashChart.new
    project = Project.find(params[:id])
    add_title(chart, project.name, "Coverage vs. Commits")

    codes = read_complexity(project)
    max_commit = codes.map {|code| code.commit}.max
    max_coverage = codes.map {|code| code.coverage}.max
    
    add_coverage_element_for_project(chart, codes)
    add_axis(chart, max_commit, max_coverage, "Coverage")
    
    render :text => chart.to_s
  end
  
  private
  def read_complexity project
    commits = $code_commits
    # complexity = project.code_complexity
    # coverages = project.code_coverage
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
  
  def add_title(chart, project_name, measurement)
    title = Title.new(project_name + ": " + measurement)
    title.set_style('{font-size: 29px; color: #771177}')
    chart.set_title(title)
  end
  
  def add_axis(chart, max_x, max_y, y_label)
    x = XAxis.new
    x.set_range(0, max_x + 10, max_x/20)
    x_legend = XLegend.new("commits per file")
    x_legend.set_style('{font-size: 24px; color: #778877}')
    chart.set_x_legend(x_legend)
    chart.set_x_axis(x)
  
    y = XAxis.new
    y.set_range(0, max_y+ 10, max_y/10)
    y_legend = YLegend.new(y_label)
    y_legend.set_style('{font-size: 24px; color: #770077}')
    chart.set_y_legend(y_legend)
    chart.set_y_axis(y)
  end
  
  def add_complexity_element_for_project(chart, codes)
    scatter = Scatter.new('#FFD600', 10) 
    scatter.values = codes.map! { |code|
      new_scatter_point(code.commit, code.complexity, code.tip)
    }
    scatter.set_dot_style("dot")
    chart.add_element(scatter)
  end
  
  
  def add_coverage_element_for_project(chart, codes)
    scatter = Scatter.new('#FFD600', 10) 
    scatter.values = codes.map! { |code|
      new_scatter_point(code.commit, code.coverage, code.tip)
    }
    scatter.set_dot_style("dot")
    chart.add_element(scatter)
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