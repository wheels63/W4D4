require "tdd"
require "spec_helper"

describe "#my_unique" do
  subject(:arr) { [1,2,1,3,3] }

  it "takes in an array" do
    expect{my_unique(arr)}.to_not raise_error
  end
    
  it "and returns an array of unique elements" do
    expect(my_unique(arr)).to eq([1,2,3])
  end
end

describe "#two_sum" do
  subject(:arr) { [-1, 0, 2, -2, 1] }

  it "takes in an array" do
    expect{two_sum(arr)}.to_not raise_error
  end

    it "and returns all pairs of positions where the elements at those positions sum to zero." do
    expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
  end

end

describe Array do 

  describe "#my_transpose" do
    subject(:arr) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ] }
    
    it "transposes an array" do 
      expect(arr.my_transpose).to eq([[0,3,6],
        [1,4,7],
        [2,5,8]
      ])
    end
  end
end

describe "#stock_picker" do 
  subject(:arr) { [4, 50, 200, 400, 150] }

  it "takes in an array" do
    expect{stock_picker(arr)}.to_not raise_error
  end

  it "outputs the most profitable pair of days on which to first buy the stock and then sell the stock." do
    expect(stock_picker(arr)).to eq(396)
  end
end

describe Game do
  subject(:game) {Game.new}

  describe "#initialize" do
    it "should create a stack full of discs" do
      expect(game.stack1).to eq([8,7,6,5,4,3,2,1])
    end

    it "should create two empty stacks" do
      expect(game.stack2).to eq([])
      expect(game.stack3).to eq([])
    end

    describe "#move" do
      it "should not change the array when a bad move is passed in and it should raise an error" do
        game.stack2 = [0]
        expect{game.move(game.stack1, game.stack2)}.to raise_error
      end

      it "should change the array when a good move is passed in" do
        game.move(game.stack1, game.stack2)
        expect(game.stack1).to eq([8,7,6,5,4,3,2])
        expect(game.stack2).to eq([1])
      end
    end

    describe "#won?" do
    # win by moving stack1 to stack3, not breaking any rules
      it "should return true if the game is won" do
        game.stack3 = [8,7,6,5,4,3,2,1]
        expect(game.won?).to eq(true)
      end
    end

  end

  


end

# describe Dessert do
#   let(:chef) { double("chef", name: "Yoshi") }
#   let(:macaroon) { Dessert.new("macaroon", 20, chef) }

#   describe "#initialize" do
#     it "sets a type" do 
#       expect(macaroon.type).to eq("macaroon")
#     end

#     it "sets a quantity" do
#       expect(macaroon.quantity).to eq(20)
#     end

#     it "starts ingredients as an empty array"
#       expect(brownie.ingredients).to be_empty
#     end

#     it "raises an argument error when given a non-integer quantity"
#       expect { Dessert.new("cake", "tons", chef) }.to raise_error(ArgumentError)
#     end
#   end

#   describe "#add_ingredient" do
#     it "adds an ingredient to the ingredients array" do
#       macaroon.add_ingredient("sugar")
#       expect(macaroon.ingredients).to include("sugar")
#     end
#   end

#   describe "#mix!" do
#     it "shuffles the ingredient array" do 
#       ingredients = ["sugar", "egg", "butter", "salt", "cream", "vanilla extract"]

#       ingredients.each do |ingredient|
#         macaroon.add_ingredient(ingredient)
#       end

#       expect(macaroon.ingredients).to eq(ingredients)
#       macaroon.mix!
#       expect(macaroon.ingredients).not_to eq(ingredients)
#       expect(macaroon.ingredients.sort).to eq(ingredients.sort)
#     end
#   end

#   describe "#eat" do
#     it "subtracts an amount from the quantity" do
#       macaroon.eat(5)
#       expect(macaroon.quantity).to eq(15)
#     it "raises an error if the amount is greater than the quantity" do
#       expect { macaroon.eat(25)}.to raise_error("not enough macaroons, buckaroo")
#     end
#   end

#   describe "#serve" do
#     it "contains the titleized version of the chef's name" do
#       allow(chef).to receive(:titleize).and_return("Chef Yoshi the Great Baker")
#       expect(macaroon.serve).to eq("Chef Yoshi the Great Baker has made 20 macaroons!")
#     end
#   end

#   describe "#make_more" do
#     it "calls bake on the dessert's chef with the dessert passed in" do
#       expect(chef).to receive(:bake).with(macaroon)
#       macaroon.make_more
#     end
#   end
# end
