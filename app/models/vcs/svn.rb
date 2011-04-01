class Vcs::Svn
  include Vcs::LogParser
  
  def initialize
    @language = DDR_ENV[:language]
    @vcs = DDR_ENV[:vcs]
  end

  private
  def is_source_code_log? line
     result = (line.end_with? source_code_postfix) and (line.start_with? "M " or line.start_with? "A ")
     result
  end
  
  def read_line_into_commits line, commits
    code_changed = changes_in_one_commit(line)
    put_code_change_into_commits(code_changed, commits)
  end
  
  def changes_in_one_commit line
    line.split(" ")[1]
  end
end