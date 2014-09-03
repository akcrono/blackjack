require_relative 'card'

class Hand
  attr_accessor :total_score

  def initialize
    @cards_in_hand = []
  end

  def draw(card)
    @cards_in_hand << card
  end

  def total_score
    temp = @cards_in_hand.sort_by { |card|  -card.value }
    total = 0
    i = 0
    temp.each_with_index do |card, i|
      if card.value > 10
        total += 10
      elsif card.value == 1
        if temp[i+1] != nil
          total += 1
        else
          if total + 11 > 21
            total += 1
          else
            total += 11
          end
        end
      else
        total += card.value
      end
    end
    total
  end

  def <(hand)
    if @total_score < hand.total_score
      return true
    end
    false
  end

  def >(hand)
    if @total_score > hand.total_score
      return true
    end
    false
  end

  def is_bust?
    if self.total_score > 21
      return true
    end
  false
  end
  def print
    @cards_in_hand.each do |card|
      card.print
    end
  end
end
