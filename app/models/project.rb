class Project
  attr_reader :name
  
  def initialize(name, vcs, language)
    set_instance_variables(binding, *local_variables)
  end
  
  def self.find(name)
    project = Project.new(name, DDR_ENV[:vcs], DDR_ENV[:language])
  end
  
  def read measurement_parser
    measurement_parser.parse(@name)
  end
end