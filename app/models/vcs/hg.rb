class Vcs::Hg
  include Vcs::LogParser

  def initialize
    @language = DDR_ENV[:language]
    @vcs = DDR_ENV[:vcs]
  end
  
  private
  def describes_code_commitment? line
    line.starts_with?("files:")
  end
  
  def read_line_into_commits line, commits
    changes_in_one_commit(line).each{|change|
      put_code_change_into_commits(change, commits)
    }
  end
  
  def changes_in_one_commit line
    line.split(" ").reject{|c| c == "file:"}
  end
end