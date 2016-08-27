class Encoder
  attr_reader :number
  PADDING = 8192

  def initialize(number)
    @number = number
  end

  def encode
    encoded_bytes = Clearer.new(Splitter.new(bytes).split).clear
    hexes = []
    encoded_bytes.each do |byte|
      hexes << to_hex(byte.to_i(2))
    end
    hexes.each.collect { |h| pad_hex(h) }.join
  end

  private

  def padded_number
    number + PADDING
  end

  def to_hex(num)
    num.to_s(16)
  end

  def bytes
    padded_number.to_s(2)
  end

  def pad_hex(hex)
    if hex.length < 2
      zero_pad(hex)
    else
      hex
    end
  end

  def zero_pad(str, amount: 1)
    amount.times do
      str = "0" + str
    end
    str
  end
end
