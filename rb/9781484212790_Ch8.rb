# This class stores information about people.
class Person
  attr_accessor :name, :age, :gender

  # Create the person object and store their name
  def initialize(name)
    @name = name
  end

  # Print this person's name to the screen
  def print_name
    puts "Person called #{@name}"
  end
end

# ----

# rdoc person.rb

# ----

#= RDoc Example
#
#== This is a heading
#
#* First item in an outer list
# * First item in an inner list
# * Second item in an inner list
#* Second item in an outer list
# * Only item in this inner list
#
#== This is a second heading
#
#Visit www.rubyinside.com
#
#== Test of text formatting features
#
#Want to see *bold* or _italic_ text? You can even embed
#+text that looks like code+ by surrounding it with plus
#symbols. Indented code will be automatically formatted:
#
# class MyClass
#   def method_name
#     puts "test"
#   end
# end

class MyClass
end

# ----

# This is a class that does nothing
class MyClass
  # This method is documented
  def some_method
  end
  def secret_method #:nodoc:
  end
end

# ----

# This is a class that does nothing
class MyClass #:nodoc: all
  # This method is documented (or is it?)
  def some_method
  end


  def secret_method
  end
end

# ----

# This section is documented and read by RDoc.
#--
# This section is hidden from RDoc and could contain developer
# notes, private messages between developers, etc.
#++
# RDoc begins processing again here after the ++.

# ----

irb(main):001:0> puts 10 / 0

# ----

class Person
  def initialize(name)
    raise ArgumentError, "No name present" if name.empty?
  end
end

# ----

fred = Person.new('')

# ----

class BadDataException < RuntimeError
end

class Person
  def initialize(name)
    raise BadDataException, "No name present" if name.empty?
  end
end

# ----

begin
  puts 10 / 0
rescue
  puts "You caused an error!"
end

# ----

data = ""
begin
  # <..code to retrieve the contents of a Web page..>
  data = '' #<..content of Web page..>
rescue
  puts "The Web page could not be loaded! Using default data instead."
  data = '' #<..load data from local file..>
end
puts data

# ----

begin
  #... code here ...
rescue ZeroDivisionError
  #... code to rescue the zero division exception here ...
rescue YourOwnException
  #... code to rescue a different type of exception here ...
rescue
  #... code that rescues all other types of exception here ...
end

# ----

begin
  puts 10 / 0
rescue => e
  puts e.class
end

# ----

catch(:finish) do
  1000.times do
    x = rand(1000)
    throw :finish if x == 123
  end

  puts "Generated 1000 random numbers without generating 123!"
end

# ----

def generate_random_number_except_123
  x = rand(1000)
  throw :finish if x == 123
end


catch(:finish) do
  1000.times { generate_random_number_except_123 }
  puts "Generated 1000 random numbers without generating 123!"
end

# ----

i = 1
j = 0
until i > 1000000
  i *= 2
  j += 1
end
puts "i = #{i}, j = #{j}"

# ----

# ruby –r debug debugtest.rb

# ----

class String
  def titleize
    self.capitalize
  end
end

# ----

puts "this is a test".titleize

# ----

raise "Fail 1" unless "this is a test".titleize == "This Is A Test"
raise "Fail 2" unless "another test 1234".titleize == "Another Test 1234"
raise "Fail 3" unless "We're testing titleize".titleize == "We're Testing Titleize"

# ----

class String
  def titleize
    self.gsub(/\b\w/) { |letter| letter.upcase }
  end
end

# ----

puts "We're testing titleize".titleize

# ----

class String
  def titleize
    self.gsub(/\s\w/) { |letter| letter.upcase }
  end
end

# ----

class String
  def titleize
    self.gsub(/(\A|\s)\w/){ |letter| letter.upcase }
  end
end

# ----

class String
  def titleize
    self.gsub(/(\A|\s)\w/){ |letter| letter.upcase }
  end
end

require '/'

class TestTitleize < Minitest::Test
  def test_basic
    assert_equal("This Is A Test", "this is a test".titleize)
    assert_equal("Another Test 1234", "another test 1234".titleize)
    assert_equal("We're Testing", "We're testing".titleize)
  end
end

# ----

assert_equal("Let's make a test fail!", "foo".titleize)

# ----

assert_equal("This Is A Test", "this is a test".titleize)

# ----

require 'benchmark'
puts Benchmark.measure { 10000.times { print "." } }

# ----

require 'benchmark'
iterations = 1000000

b = Benchmark.measure do
  for i in 1..iterations do
    x = i
  end
end

c = Benchmark.measure do
  iterations.times do |i|
    x = i
  end
end

puts b
puts c

# ----

require 'benchmark'
iterations = 1000000

Benchmark.bm do |bm|
  bm.report("for:") do
    for i in 1..iterations do
      x = i
    end
  end
  bm.report("times:") do
    iterations.times do |i|
      x = i
    end
  end
end

# ----

# gem install ruby-prof

# ----

# place this into calculator.rb
require 'profile'
class Calculator
  def self.count_to_large_number
    x = 0
    100000.times { x += 1 }
  end
  def self.count_to_small_number
    x = 0
    1000.times { x += 1 }
  end
end

Calculator.count_to_large_number
Calculator.count_to_small_number

# ----

# ruby-prof calculator.rb

# ----

