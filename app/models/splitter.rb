class Splitter
  attr_accessor :bytes, :hi_byte, :lo_byte

  def initialize(bytes)
    @bytes = bytes
    @hi_byte = []
    @lo_byte = []
  end

  def split
    bit_array = bits
    while bit_array.length > 8
      hi_byte.push(bit_array.shift)
    end
    lo_byte = bit_array
    { hi_array: hi_byte, lo_array: lo_byte }
  end

  private

  def bits
    bytes.split(//)
  end
end
