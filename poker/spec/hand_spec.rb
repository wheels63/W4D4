require 'deck.rb'
require 'hand.rb'
require 'card.rb'

describe Hand do 
  subject(:hand1) { [Card.new(3, "hearts", "Ace"), Card.new(3, "hearts", "Ace"), Card.new(4, "hearts", "Ace"), Card.new(5, "hearts", "Ace"), Card.new(6, "hearts", "Ace")] }
  # subject(:hand2) { Hand.new }
  # let(:deck) { Deck.new }
  subject(:hand2) { [Card.new(14, "hearts", "Ace"), Card.new(14, "hearts", "Ace"), Card.new(14, "hearts", "Ace"), Card.new(14, "hearts", "Ace"), Card.new(3, "hearts", "3")] }
  describe "::compare" do
    it "should correctly return which hand is larger" do
      expect(Hand.compare(deck, deck2)).to eq(deck2)
    end
  end

  describe "#calculate_hand" do 
    it "should calculate the value of a hand" do

    end

    it "calculates based on the strongest set in the hand from royal flush down to no pair" do

    end

  end

  describe "#of_a_kind" do
    it "should return number of identical values in hand" do
      expect(hand1.of_a_kind(hand1.cards)).to eq(4)
      expect(hand2.of_a_kind(hand2.cards)).to eq(2)
    end
  end
end