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
  
  def code_complexity
    codes = {}
    complexity_file = File.join(DDR_ENV[:project_root], @name, "complexity.txt")
    File.open(complexity_file) { |f|
      while line = f.gets
        tmp = line.split(":")
        codes[tmp[0]] = Code.new(tmp[0], 0, tmp[1].to_i, 0)
      end
    } 
    codes
  end
  
  def code_coverage
    codes = {}
    coverage_file = File.join(DDR_ENV[:project_root], @name, "coverage.txt")
    File.open(coverage_file) { |f|
      while line = f.gets
        tmp = line.split(":")
        codes[tmp[0]] = Code.new(tmp[0], 0, 0, tmp[1].to_f)
      end
    } 
    codes
  end
end