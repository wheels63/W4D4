
def my_unique(arr)
  arr.uniq
end

def two_sum(arr)

  output = []

  arr.each.with_index do |el1,i1|
    arr.each.with_index do |el2,i2|
      output << [i1,i2] if i2 > i1 && el1 + el2 == 0
    end
  end
  output
end

class Array

  def my_transpose
    self.transpose
  end

end

def stock_picker(arr)
  max_delta = 0
  arr.each.with_index do |el1,i1|
    temp_delta = 0
    arr.each.with_index do |el2,i2|
      if i2 > i1
        temp_delta = el2 - el1
      end
      max_delta = temp_delta if temp_delta > max_delta
    end
  end
  max_delta
end

class Game
  attr_accessor :stack1, :stack2, :stack3
  def initialize
    @stack1 = [8,7,6,5,4,3,2,1]
    @stack2 = []
    @stack3 = []
  end

  def input
    puts "enter a stack to take from, and to move to: e.g. 1,3)"
    input = gets.chomp
    input.split(",").map(&:to_i)
    move(input[0],input[1])
  end

  def move(stack1, stack2)
    return nil if stack1.empty?

    if stack2.empty? || stack1.last < stack2.last
      stack2.push(stack1.pop)
    else
      raise "doesn't work"
    end
  end

  def won?
    return true if self.stack3 == [8,7,6,5,4,3,2,1]
  end

end

# class Dog

#   def initialize(age)
#     @age = age
#   end
#   def older(dog1) # a dog comparing ITSELF to another dog, AM I OLDER?
#     self.age < dog1.age
#   end
#   dog2.older(dog1)
#   # to compare one instance to another known instance of dog
#   # both do the same thing (lines 74 and 81)

#   def self.older(dog1,dog2) # truly a third party of the dog class, comparing two dogs
#     dog2.age < dog1.age
#   end
#   Dog.older(dog1,dog2)
#   # generall preferred way of using 
#   # to let the class know the comparison of ages of two dog instances
# end


