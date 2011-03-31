class Vcs::Git
  include Vcs::LogParser

  def initialize
    @language = DDR_ENV[:language]
    @vcs = DDR_ENV[:vcs]
  end
  
  private
  def is_source_code_log? line
     line.end_with? source_code_postfix and (line.start_with? "M " or line.start_with? "A ")
  end
  
  def read_line_into_commits line, commits
    code_changed = change_in_one_commit(line)
    if(commits.has_key?(code_changed))
      commits[code_changed] = commits[code_changed] + 1
    else
      commits[code_changed] = 1
    end
  end
  
  def changes_in_one_commit line
    line.split(" ")[1]
  end
end