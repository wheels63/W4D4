class Card
  attr_reader :card, :suit
  def initialize(val, suit, card)
    @card = card
    @val = val
    @suit = suit
  end
end