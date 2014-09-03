require_relative 'card'
require_relative 'deck'
require_relative 'hand'

def play_again? game_result
  puts game_result
  puts "Do you want to play again?(y/n)"
  if gets.chomp == 'y'
    return true
  end
  false
end


def play_game
  deck = Deck.new

  dealer_hand = Hand.new
  player_hand = Hand.new

  2.times do |i|
    dealer_hand.draw(deck.draw)
    player_hand.draw(deck.draw)
  end

  puts "\nThis is your hand:"
  player_hand.print
  puts "Total score: #{player_hand.total_score}"
  puts "What would you like to do?(hit/stand)"

  player_response = gets.chomp

  while player_response != 'stand'
    if player_response != 'hit' && player_response != 'stand'
      puts "Invalid input."
    else
      player_hand.draw(deck.draw)
      puts "\nThis is your hand:"
      player_hand.print
      puts "Total score: #{player_hand.total_score}"
      if player_hand.is_bust?
        return play_again?("Player busts.  You lose!")
      end
      puts "What would you like to do?(hit/stand)"
    end
    player_response = gets.chomp
  end

  puts "Dealer has:"
  dealer_hand.print

  while dealer_hand.total_score <= 16
    dealer_hand.draw(deck.draw)
      puts "Dealer now has:"
    dealer_hand.print
  end

  if dealer_hand.is_bust?
    return play_again?("Dealer busts.  You win!")
  else
    puts "Player's score: #{player_hand.total_score}"
    puts "Dealer's score: #{dealer_hand.total_score}"

    if player_hand > dealer_hand
      return play_again?("Congratulations!  You win.")
    else
      return play_again?("Oh no! The dealer wins!")
    end
  end
end

while play_game
end
