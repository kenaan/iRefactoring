class Project
  attr_reader :name
  
  def initialize(name, vcs, language)
    set_instance_variables(binding, *local_variables)
  end
  
  def self.find(name)
    project = Project.new(name, DDR_ENV[:vcs], DDR_ENV[:language])
  end

  def analysis
    codes = code_complexity
    commits = $code_commits
    codes.each_key{ |key|
      commit = commits[key]
      if(!commit.nil?)
        codes[key].commit = commit
      end
    }
    codes.values
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
    complexity_file = File.join(DDR_ENV[:project_root], @name, "coverage.txt")
    File.open(complexity_file) { |f|
      while line = f.gets
        tmp = line.split(":")
        codes[tmp[0]] = Code.new(tmp[0], 0, 0, tmp[1].to_f)
      end
    } 
    codes
  end
end