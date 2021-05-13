require 'rspec'
require 'card.rb'

describe Card do
  subject(:card) { Card.new("2", "hearts", "2")}
  describe "#initialize" do
    it "should take in a card value and a suit" do
      expect{ Card.new(2, "spades", "2") }.to_not raise_error
    end
  end
end