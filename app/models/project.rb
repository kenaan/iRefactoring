class Project
  attr_reader :name
  
  def initialize(name, vcs, language)
    set_instance_variables(binding, *local_variables)
  end
  
  def self.find(name)
    project = Project.new(name, DDR_ENV[:vcs], DDR_ENV[:language])
  end
  
  def read_code_measurement measurement_name
    measurement_results = read(eval("Measurement::#{measurement_name.capitalize}.new()"))

    measurement_results.each_key{ |code_name|
      update_code_with_commits(code_name, $code_commits){ |commit|
        measurement_results[code_name].commit = commit
      }
    }
    return measurement_results.values
  end

  private
  def update_code_with_commits code_name, commits, &block
    commit = commits[code_name]
    if(!commit.nil?)
      yield(commit)
    end
  end
  
  def read measurement_parser
    measurement_parser.parse(@name)
  end
end