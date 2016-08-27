class ConvertData
  attr_reader :file

  def initialize
    @file = "ConvertedData.txt"
  end

  def output_encode
    File.open(file, 'a+') do |f|
      f.write("Encoding....\n")
      [6111, 340, -2628, -255, 7550].each do |num|
        f.write(Encoder.new(num).encode + "\n")
      end
    end
  end

  def output_decode
    File.open(file, 'a+') do |f|
      f.write("Decoding....\n")
      {"0A" => "0A", "00" => "29", "3f" => "0f", "44" => "00", "5e" => "7f" }.each do |hex1, hex2|
        f.write(Decoder.new(hex1, hex2).decode.to_s + "\n")
      end
    end

  end
end
