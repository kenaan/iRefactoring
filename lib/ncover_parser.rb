require 'rubygems'
require 'nokogiri'
require 'fileutils'

class NcoverParser
  
  def initialize(useless_absolute_path_will_be_trimed, input_dir, output_dir)
    @useless_absolute_path_will_be_trimed = useless_absolute_path_will_be_trimed
    @input_dir = input_dir
    @output_dir = output_dir
    FileUtils.mkdir_p @output_dir
  end
  
  ["complexity", "coverage"].each{ |method|
    class_eval %Q{
      def read_#{method}
        log = File.join(@input_dir, log_file_name)
        #{method} = parse_log_to_#{method}(log)
        file = File.new(File.join(@output_dir, "#{method}.txt"), "w")
        #{method}.each_key{ |key|
            file.puts key + ":" + #{method}[key]
        }
        file.close
      end
    }
  }
  
  private
  
  def log_file_name
    "sources_full.html"
  end
  
  def parse_log_to_coverage file
    parse_log(file) do |row|
      coverage_description = row.xpath("td[2]/span").inner_html.strip
      coverage_description.split(":")[0].strip
    end
  end
  
  def parse_log_to_complexity file
    parse_log(file) do |row|
      row.xpath("td[5]/span").inner_html.strip
    end
  end
  
  def parse_log(file, &block)
    @doc = Nokogiri::HTML(open(file), nil, "utf-8")
    rows = @doc.xpath("//table[@class='sortable']/tr")
    result = {}
    #the first row is the heading and the last row is the summary, so those two rows needs to be filtered out from parsing class
    rows[1..rows.length-2].each do |row|
      class_name = row.xpath("td[@class='detail']/a").inner_html.strip.split(@useless_absolute_path_will_be_trimed)[1]
      class_name_converted = class_name.split("\\").join(File::SEPARATOR)
      result[class_name_converted] = yield(row)
    end
    result
  end
end

["admin", "admin-cli", "crm", "framework", "mytaxes", "questionnaire", "questionnaire-admin-cqs", "questionnaire-admin-gde", "questionnaire-admin-integration"].each{ |project|
  ncover = NcoverParser.new("c:\\Cruise-Agent\\pipelines\\Trunk-Quality-of-Service\\", "/Users/twer/workspace/iRefactoring/sample/cwp/#{project}", "/Users/twer/workspace/iRefactoring/projects/#{project}")
  ncover.read_complexity
  ncover.read_coverage
}
