class Player
  attr_accessor :name, :card, :wins
  def initialize(name = "")
    @name = name
    @card = nil
    @wins = 0
  end
end
