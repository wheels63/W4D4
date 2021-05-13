require 'rspec'
require 'deck'

describe Deck do
  subject(:d) { Deck.new }
  # describe "#initialize" do
  #   it "should create an empty deck" do
  #     expect(d.deck).to eq([])
  #   end
  # end

  describe "::make_new_deck" do
    before(:each) do
      d.deck = Deck.make_new_deck
    end
    it "should make a full deck" do
      expect(d.deck.length).to eq(52)
    end

    it "every card should be unique" do
      expect(d.deck.uniq).to eq(d.deck)
    end
  end

  describe "#shuffle" do
    before(:each) do
      d.deck = Deck.make_new_deck
    end

    it "should shuffle cards" do 
      expect(d.deck).to_not eq(d.deck.shuffle)
    end
  end
end