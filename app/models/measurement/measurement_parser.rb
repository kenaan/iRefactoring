module Measurement::MeasurementParser
  def parse_file_to_line(project_name, &block)
    codes = {}
    File.open(File.join(DDR_ENV[:project_root], project_name, filename)) { |f|
      while line = f.gets
        yield(codes, line)
      end
    } 
    codes
  end
end
