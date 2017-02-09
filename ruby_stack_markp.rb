#!/usr/bin/env ruby
# Array-based Ruby Stack
# @author Mark Pernabekov

class Stack
  # Constructor that can accept an array of integers
  # If no array is provided, it will use an empty array
  def initialize
    @stack = []
    @min = self.peek # initialize minimum to equal the last element of the stack
  end
  
  # Remove and return the last element of the stack or nil if empty
  def pop
    last = @stack.pop
  end
  
  # Push an integer to the end of the stack
  def push(number)
    raise number + " is not a valid integer" unless number.is_a? Fixnum # exit if not a valid integer
    @stack.push(number)
	@min = number if @min.nil? || @min > number # update the min variable once per push
	number # return the number that was just added
  end
  
  # Return the last element within stack without removing it
  def peek
    @stack[-1] #unless @stack.empty? #returns the last element of the stack 
	                                 #(same as @stack.last), ignoring empty stacks
  end
  
  # Returns the smallest integer within the stack
  def min
    @min
  end
  
  # Checks whether the stack is empty
  def empty
    @stack.empty?
  end
end

# Testing
ary = [0,1,-1,'b',"%&*"] # array to hold test values

begin
  stack = Stack.new
  ary.each {|elem| puts "Adding " + elem.to_s + " to the stack"; stack.push(elem)}
  # The following two lines should be skipped due to an exception
  print "The last element in the stack is: "
  puts stack.peek
rescue Exception => e
  puts "----------"
  puts "Exception encountered: ", e.message
  puts "----------"
end

puts "The current smallest number in the stack is: " + stack.min.to_s

num = stack.pop
puts "Removed #{num} from the end of the stack"
last = stack.peek
num = stack.pop
puts "Asserting that #{last} and #{num} are the same: #{last == num}"
num = stack.pop
puts "Removed #{num} from the end of the stack"
print "Result of calling peek() on an empty stack: "
puts stack.peek #should display nothing

begin
  stack = Stack.new([1,2]) #this should throw an ArgumentError exception
  stack = Stack.new("b") #this too should throw an exception
rescue ArgumentError => e
  puts "Unable to create Stack: ", e.message
end