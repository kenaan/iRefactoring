require 'rubygems'
require 'nokogiri'
require 'fileutils'

class RcovParser
  
  def initialize(input_dir, output_dir)
    @input_dir = input_dir
    @output_dir = output_dir
    FileUtils.mkdir_p @output_dir
  end
  
  def read_coverage
    log = File.join(@input_dir, log_file_name)
    coverage = parse_log(log)
    file = File.new(File.join(@output_dir, "coverage.txt"), "w")
    coverage.each_key{ |key|
        file.puts key + ":" + coverage[key]
    }
    file.close
  end
  
  private
  
  def log_file_name
    "index.html"
  end
  
  def parse_log(file)
    @doc = Nokogiri::HTML(open(file), nil, "utf-8")
    rows = @doc.xpath("//table[@id='report_table']/tbody/tr")
    result = {}
    rows[0..rows.length].each do |row|
      class_name = row.xpath("td[1]/a").inner_html.strip
      coverage = row.xpath("td[5]/div/tt").inner_html.strip
      result[class_name] = coverage
    end
    result
  end
end

rcov = RcovParser.new("/Users/twer/workspace/iRefactoring/sample/irefactoring", "/Users/twer/workspace/iRefactoring/projects/irefactoring")
rcov.read_coverage
