require_relative 'deck.rb'
class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def self.compare(hand1, hand2)
    return hand1 if r_flush?(hand1)
    return hand2 if r_flush?(hand2)

    if straight_flush?(hand1) && straight_flush?(hand2)
        a = calculate_hand(hand1) 
        b = calculate_hand(hand2)
        return (a > b ? a : b)
    end
    return hand1 if straight_flush?(hand1)
    return hand2 if straight_flush?(hand2)

    h1 = hand1.of_a_kind(hand1.cards)
    h2 = hand2.of_a_kind(hand2.cards)

    if h1.values.max == 4 && h2.values.max == 4
      key1 = h1.key(4)
      key2 = h2.key(4)
      return (key1 > key2 ? hand1 : hand2)
    end
    return hand1 if h1.key(4)
    return hand2 if h2.key(4)

    if self.full_house?(h1) && self.full_house?(h2)
      key1 = h1.key(3)
      key2 = h2.key(3)
      return (key1 > key2 ? hand1 : hand2)
    end
    return hand1 if full_house?(h1)
    return hand2 if full_house?(h2)

    if flush?(hand1) && flush?(hand2)
      a = calculate_hand(hand1)
      b = calculate_hand(hand2)
      return (a > b ? hand1 : hand2)
    end
    return hand1 if flush?(hand1)
    return hand2 if flush?(hand2)

    if straight?(hand1) && straight?(hand2)
      a = calculate_hand(hand1)
      b = calculate_hand(hand2)
      return (a > b ? hand1 : hand2)
    end
    return hand1 if straight?(hand1)
    return hand2 if straight?(hand2)

    if h1.values.max == 3 && h2.values.max == 3
      key1 = h1.key(3)
      key2 = h2.key(3)
      return (key1 > key2 ? hand1 : hand2)
    end
    return hand1 if h1.key(3)
    return hand2 if h2.key(3)
  end

  def two_pair?(cards_hash)
    pairs = cards_hash.values.count { |val| val == 2 }
    pairs == 2
  end

  def full_house?(cards_hash)
    cards_hash.key(3) && cards_hash.key(2)
  end
  def of_a_kind(cards)
    values = cards.map {|card| card.card }
    hash = Hash.new(0)
    values.each do |val|
      hash[val] += 1
    end

    hash #return the hash containing number of duplicates of cards
  end
  def calculate_hand

  end

  def flush?(hand)
    hand.cards.all? { |card| card.suit == cards[0].suit }
  end

  def straight_flush?(hand)
    straight?(hand) && flush?(hand)
  end

  def r_flush?(hand)
    cards = [:queen, :king, :ace, :jack, "10"]
    cards.each do |card|
      our_cards = hand.cards.map{ |card| card.card }
      return false if !our_cards.include?(card)
    end
    flush?(hand) && straight?(hand)
  end

  def straight?(hand)
    sorted = hand.cards.sort_by { |a, b| a.val < b.val }
    (0..sorted.length - 1).each do |i|
      return false if !(sorted[i] == sorted[i + 1] - 1)
    end
    true
  end

end

d = Deck.new
h = Hand.new
d.shuffle
5.times { h.cards << d.deck.pop }
p h.cards.map
