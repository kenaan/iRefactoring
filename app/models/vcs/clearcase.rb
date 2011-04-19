class Vcs::Clearcase
  include Vcs::LogParser

  def initialize
    @language = DDR_ENV[:language]
    @vcs = DDR_ENV[:vcs]
  end
  
  private
  def describes_code_commitment? line
    !line.strip.empty?
  end
  
  def read_line_into_commits line, commits
    code_changed = changes_in_one_commit(line)
    put_code_change_into_commits(code_changed, commits)
  end
  
  def changes_in_one_commit line
    line.split(" ")[2].gsub(/"/,'')
  end
end