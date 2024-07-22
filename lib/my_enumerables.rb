module Enumerable
  # Your code goes here
  def my_all?
    meet_given_criterion = []

    my_each do |element|
      meet_given_criterion << element if yield(element)
    end

    meet_given_criterion == self
  end

  def my_any?
    meet_given_criterion = []

    my_each do |element|
      meet_given_criterion << element if yield(element)
    end

    meet_given_criterion.length.positive?
  end

  def my_count
    if block_given?
      meet_given_criterion = []

      my_each do |element|
        meet_given_criterion << element if yield(element)
      end

      meet_given_criterion.length
    else
      length
    end
  end

  def my_each_with_index
    index = 0

    my_each do |element|
      yield(element, index)

      index += 1
    end
  end

  def my_inject(initial_operand = 0)
    total = initial_operand

    my_each do |element|
      total = yield(total, element)
    end

    total
  end

  def my_map
    new_array = []

    my_each do |element|
      new_array << yield(element)
    end

    new_array
  end

  def my_none?
    meet_given_criterion = []

    my_each do |element|
      meet_given_criterion << element if yield(element)
    end

    meet_given_criterion.empty?
  end

  def my_select
    meet_given_criterion = []

    my_each do |element|
      meet_given_criterion << element if yield(element)
    end

    meet_given_criterion
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i <= (length - 1)
      yield(self[i])

      i += 1
    end

    self
  end
end
