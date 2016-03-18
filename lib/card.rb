class Card    
  attr_accessor :suit, :rank
  SUIT = [ {val:  4, suit: "SPADE"}, { val: 3, suit: "HEART" }, { val: 2, suit: "DIAMOND" }, { val: 1, suit: "CLUB" }]
  RANK = [ {val: 2, face: nil}, {val: 3, face: nil}, {val: 4, face: nil}, { val: 5, face: nil }, {val: 6, face: nil}, {val: 7, face: nil}, { val: 8, face: nil },
           {val: 9, face: nil}, {val: 10, face: nil}, {val: 11, face: "Jack"}, {val: 12, face: "Queen"}, {val: 13, face: "King"}, { val: 14, face: "Ace" } ]
  def initialize( card )
    self.rank = RANK[card % 13]
    self.suit = SUIT[card % 4]
  end
end
