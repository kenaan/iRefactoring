class Vcs::Hg
  include Vcs::LogParser

  def initialize
    @language = DDR_ENV[:language]
    @vcs = DDR_ENV[:vcs]
  end
  
  private
  def is_source_code_log? line
    line.starts_with?("files:")
  end
  
  def read_line_into_commits line, commits
    changes_in_one_commit(line).each{|change|
      put_code_change_into_commits(change, commits)
    }
  end
  
  def changes_in_one_commit line
    line.split(" ").reject{|c| c == "file:" || !(c.ends_with?(source_code_postfix))}
  end

end