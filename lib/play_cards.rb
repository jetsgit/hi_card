require_relative "deck"
require_relative "player"

class PlayCards
  attr_accessor :players, :deck
  def initialize(card_players =   [ "Jerry",  "Mary", "Louise","Jeff" ] )
    @players = []
    card_players.each do |player|
      @players << Player.new(player)
    end  
    @deck ||= Deck.new
    deck.cards.shuffle!(random: Random.rand)
  end

  def deal
    players.map do |player|
      player.card = deck.cards.pop
    end
  end

  def play_again?
    while true
      puts "Would you like to play again? [y/n]: "
      case gets.strip
      when 'Y', 'y', 'yes' 
        puts 'Playing another hand, partner.'
        break
      when /\A[nN]o?\Z/ 
        exit 
      end
    end
  end

  def play
    while deck.cards.size >=  players.size
      best_hand = 0
      cur_winner = nil
      deal 
      players.each do |player|
        points = player.card.rank[:val] + player.card.suit[:val]
        if points > best_hand
          best_hand = points
          cur_winner = player
        end
        if player.card.rank[:val] < 11
          puts "#{player.name} has a #{player.card.rank[:val]} of #{player.card.suit[:suit]}'s"
        else
          puts "#{player.name} has a #{player.card.rank[:face]} of #{player.card.suit[:suit]}'s"
        end
      end
      puts "The winner is #{cur_winner.name}!!"
      cur_winner.wins += 1
      if  deck.cards.size >=  players.size 
        play_again?
      else
        puts "Game Over!!"
        winner = []
        winner <<  Player.new
        players.each do |player|
          if player.wins >  winner[0].wins
            winner[0] = player
          end
        end
        players.each do |player|
          if player.wins == winner[0].wins && player.name != winner[0].name
            winner << player
          end
        end
        if winner.size == 1
          puts "The Grand Master is #{winner[0].name}, with #{winner[0].wins} wins"
        else
          puts "It's a tie!"
          winner.each do |player|
            puts "#{player.name} won #{player.wins} games."
          end
        end
        exit
      end
    end
  end
end


