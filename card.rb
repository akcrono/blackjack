class Card
  attr_accessor :value

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def print
    if @value == 11
      formatted_value = 'J'
    elsif @value == 12
      formatted_value = 'Q'
    elsif @value == 13
      formatted_value = 'K'
    elsif @value == 1
      formatted_value = 'A'
    else
      formatted_value = @value
    end

    puts "#{formatted_value}#{@suit}"
  end
end
