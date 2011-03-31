module Measurement::MeasurementParser
  def file_exist? project_name
    return File.file? File.join(DDR_ENV[:project_root], project_name, filename)
  end
  
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
