class Code
  attr_accessor :name, :commit, :complexity, :coverage

  def initialize name, commit, complexity, coverage
    @name = name
    @commit = commit
    @complexity = complexity
    @coverage = coverage
  end
  
  def complexity_tip
    name + ": commit=> " + (commit.to_s) + " complexity=> " + (complexity.to_s)
  end
  
  def coverage_tip
    name + ": commit=> " + (commit.to_s) + " complexity=> " + (coverage.to_s)
  end
end