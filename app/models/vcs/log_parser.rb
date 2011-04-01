module Vcs::LogName
  def log_file
    File.join(DDR_ENV[:project_root], @vcs.downcase + ".txt")
  end
end

module Vcs::CodePostfix
  def source_code_postfix
    return ".cs" if @language == "csharp"
    return ".java" if @language == "java"
    return ".rb" if @language == "ruby"
    ""
  end
end

module Vcs::LogParser
  include Vcs::LogName
  include Vcs::CodePostfix
  
  def get_code_committed()
    commits = {}
    File.open(log_file) do |file|
      while line = file.gets
        line = line.strip
        next if(!is_source_code_log?line)
        read_line_into_commits(line, commits)
      end
    end
    commits
  end
  
  def put_code_change_into_commits change, commits
    if(@language == "java")
      change = convert_change_to_java_code_format change
    end
    
    if(commits.has_key?(change))
      commits[change] = commits[change] + 1
    else
      commits[change] = 1
    end
  end
  
  def convert_change_to_java_code_format change
    change_without_classpath = change.split(DDR_ENV[:classpath])[1]
    return if change_without_classpath.nil?
    code_postfix_trimmed = change_without_classpath.split(source_code_postfix)[0]
    return code_postfix_trimmed.split(File::SEPARATOR).join(".")
  end
end
