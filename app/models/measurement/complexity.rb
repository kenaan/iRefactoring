class Measurement::Complexity
  include Measurement::MeasurementParser
  def parse project_name
    parse_file_to_line(project_name) do |codes, line|      
      tmp = line.split(":")
      codes[tmp[0]] = Code.new(tmp[0], 0, tmp[1].to_i, 0)
    end
  end
  
  private 
  def filename
    "complexity.txt"
  end
end