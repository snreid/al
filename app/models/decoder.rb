class Decoder
  attr_reader :hi_byte, :lo_byte

  def initialize(hi_hex, lo_hex)
    @hi_byte = hex_to_decimal(hi_hex)
    @lo_byte = hex_to_decimal(lo_hex)
  end

  def decode
    byte_array = Clearer.new(params).revert
    byte = byte_array.join
    num = byte.to_i(2)
    num - Encoder::PADDING
  end

  private

  def hex_to_decimal(hex)
    num = hex.to_i(16)
    num.to_s(2)
  end

  def params
    {hi_array: hi_byte.split(//), lo_array: lo_byte.split(//)}
  end
end
