class Clearer
  attr_accessor :hi_array, :lo_array

  def initialize(hi_array: nil, lo_array: nil)
    @hi_array = hi_array
    @lo_array = lo_array
  end

  def clear
    cleared_bit = lo_array.shift
    hi_array.push(cleared_bit)
    [hi_array.join, lo_array.join]
  end

  def revert
    cleared_bit = hi_array.pop
    pad_lo_array.unshift(cleared_bit)
    [hi_array.join, lo_array.join]
  end

  private

  def pad_lo_array
    while lo_array.length < 7
      lo_array.unshift("0")
    end
    lo_array
  end
end
