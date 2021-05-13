require_relative "card.rb"
class Deck
  attr_accessor :deck
  def initialize
    @deck = Deck.make_new_deck
  end

  def self.make_new_deck
    new_deck = []
    numbers = (2..10).to_a.map(&:to_s)
    suits = ["hearts", "spades", "diamonds", "clubs"]

    numbers.each do |number|
      suits.each do |suit|
        new_deck << Card.new(number.to_i, suit, number.to_s)
      end
    end

    vals = { }
    vals[:jack] = 11
    vals[:queen] = 12
    vals[:king] = 13
    vals[:ace] = 14
    faces = [:jack, :queen, :king, :ace]
    faces.each do |face|
      suits.each do |suit|
        new_deck << Card.new(vals[face], suit, face)
      end
    end
    new_deck
  end

  def shuffle
    @deck = deck.shuffle
  end
end