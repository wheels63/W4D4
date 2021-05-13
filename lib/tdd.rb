
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

  def move(stack1, stack2)
    return nil if stack1.empty?

    if stack2.empty? || stack1.last < stack2.last
      stack2.push(stack1.pop)
    else
      raise "doesn't work"
    end

  end
end
