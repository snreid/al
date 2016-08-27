class Splitter
  attr_accessor :bytes, :high_byte, :low_byte

  def initialize(bytes)
    @bytes = bytes
    @high_byte = []
    @low_byte = []
  end

  def split
    bit_array = bits
    while bit_array.length > 8
      high_byte.push(bit_array.shift)
    end
    low_byte = bit_array
    { high_array: high_byte, low_array: low_byte }
  end

  def bits
    bytes.split(//)
  end
end
