class Vcs::Git
  include Vcs::LogParser

  def initialize
    @language = DDR_ENV[:language]
    @vcs = DDR_ENV[:vcs]
  end
  
  private
  def describes_code_commitment? line
     (line.start_with? "M ") || (line.start_with? "A ")
  end
  
  def read_line_into_commits line, commits
    code_changed = changes_in_one_commit(line)
    put_code_change_into_commits(code_changed, commits)
  end
  
  def changes_in_one_commit line
    line.split(" ")[1]
  end
end