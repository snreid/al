class Clearer
  attr_accessor :high_array, :low_array

  def initialize(high_array: nil, low_array: nil)
    @high_array = high_array
    @low_array = low_array
  end


  def clear
    cleared_bit = low_array.shift
    high_array.push(cleared_bit)
    [high_array.join, low_array.join]
  end
end
