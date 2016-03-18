require_relative "card"
class Deck
  attr_accessor :cards
  def initialize
    self.cards = (0..51).to_a.map! do |card|
      Card.new(card)
    end
  end
end
