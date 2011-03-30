class Graph
  include OpenFlashChart
  def initialize project_name, measurement, max_x, max_y
    @chart = OpenFlashChart.new
    @chart.set_title(create_title(project_name, measurement + " vs. commits"))
    @chart.set_x_axis(x_axis(max_x))
    @chart.set_x_legend(x_legend)
    @chart.set_y_axis(y_axis(max_y))
    @chart.set_y_legend(y_legend(measurement))
  end
  
  def add_element scatter
    @chart.add_element scatter
  end
  
  def to_s
    @chart.to_s
  end
  
  private 
  
  def create_title(project_name, measurement)
    title = Title.new(project_name + ": " + measurement)
    title.set_style('{font-size: 29px; color: #771177}')
    title
  end
  
  def x_axis(max_x)
    x = XAxis.new
    x.set_range(0, max_x + 10, max_x/20)
    x
  end
  
  def x_legend
    x_legend = XLegend.new("commits per file")
    x_legend.set_style('{font-size: 24px; color: #778877}')
    x_legend
  end
  
  def y_axis(max_y)
    y = XAxis.new
    y.set_range(0, max_y+ 10, max_y/10)
    y
  end
  
  def y_legend y_label
    y_legend = YLegend.new(y_label)
    y_legend.set_style('{font-size: 24px; color: #770077}')
    y_legend
  end
end