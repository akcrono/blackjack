require_relative 'card'

class Deck

  def initialize
    @deck_of_cards = []
    13.times do |i|
      @deck_of_cards << Card.new(i+1, '♦')
    end
    13.times do |i|
      @deck_of_cards << Card.new(i+1, '♣')
    end
    13.times do |i|
      @deck_of_cards << Card.new(i+1, '♥')
    end
    13.times do |i|
      @deck_of_cards << Card.new(i+1, '♠')
    end
    @deck_of_cards.shuffle!
  end

  def draw
    @deck_of_cards.pop
  end

end
