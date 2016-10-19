# Appendix A source code
# ---
#
# Please note that due to being a reference chapter
# we have included all of the source code in one file
# for you to copy and paste for your own use as you wish
# as there are no complete programs, as such.

puts 10

# ----

puts 10.class

# ----

# ruby name_of_script.rb

# ----

# ruby -v

# ----

# ruby -e "puts 2 + 2"

# ----

#!/usr/bin/ruby
puts "Hello, world!"

# ----

# irb
# irb(main):001:0> puts "test"
# test
# => nil
# irb(main):002:0> 10 + 10
# => 20
# irb(main):003:0> 10 == 20
# => false
# irb(main):004:0> exit

# ----

"a" + "b" + "c"

# ----

10 + 20 + 30

# ----

("a" * 5) + ("c" * 6)

# ----

a = 10
b = 20
a * b

# ----

# "20" + 10   -- this won't work

# ----

"20" + 10.to_s

# ----

"20".to_i + 10

# ----

2 == 1

# ----

2 == 2

# ----

(2 == 2) && (1 == 1)

# ----

x = 12
x * 2 == x + 1

# ----

x * x == x ** 2

# ----

(2 == 5) || (1 == 1)

# ----

(2 == 2) && !(1 == 2)

# ----

(2 == 2) && (1 != 2)

# ----

puts "The universe is broken!" if 2 == 1

# ----

if 2 == 1
  puts "The universe is broken!"
end

# ----

if 2 == 1
  puts "The universe is broken!"
else
  puts "The universe is okay!"
end

# ----

x = 12
if x == 1 || x == 3 || x == 5 || x == 7 || x == 9
  puts "x is odd and under 10"
elsif x == 2 || x == 4 || x == 6 || x == 8
  puts "x is even and under 10"
else
  puts "x is over 10 or under 1"
end

# ----

fruit = "apple"
color = case fruit
  when "orange"
    "orange"
  when "apple"
    "green"
  when "banana"
    "yellow"
  else
   "unknown"
end
puts color

# ----

x = 10
puts x > 10 ? "Higher than ten" : "Lower or equal to ten"

# ----

# expression ? true_expression : false_expression

# ----

i = 0
loop do
  i += 1
  puts i
  break if i > 100
end

# ----

i = 0
while (i < 15)
  i += 1
  next if i % 2 == 0
  puts i
end

# ----

puts 10.class

# ----

# function1(function2(function3(something)))

# ----

# something.function3.function2.function1

# ----

"this is a test".reverse

# ----

"this is a test".reverse.upcase.split(' ').reverse.join('-')

# ----

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    return @name
  end

  def age
    return @age
  end
end

person1 = Person.new('Chris', 25)
person2 = Person.new('Laura', 23)
puts person1.name
puts person2.age

# ----

class Person
  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end
end

person1.name = "Barney"
person2.age = 101
puts person1.name
puts person2.age

# ----

class Person
  attr_accessor :name, :age
end

# ----

class Person
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end
end

a = Person.new
b = Person.new
c = Person.new
puts Person.count

# ----

Hash.methods

# ----

"testing".methods

# ----

class Fixnum
  alias_method :old_plus, :+

  def +(other_number)
    return 5 if self == 2 && other_number == 2
    old_plus other_number
    end
end

puts 2 + 2

# ----

class MyClass
  def public_method
  end

  private
  def private_method1
  end

  def private_method2
  end

  protected
  def protected_method
  end
end

# ----

class MyClass
  def public_method
  end

  def private_method1
  end

  def private_method2
  end

  def protected_method
  end

  public :public_method
  private :private_method1, :private_method2
  protected :protected_method
end

# ----

"this is a test".reverse.upcase.split(' ').reverse.join('-')

# ----

"this is a test".sub(/[aeiou]/, '*')

# ----

"this is a test".gsub(/[aeiou]/, '*')

# ----

"THIS IS A TEST".gsub(/[aeiou]/, '*')

# ----

"THIS IS A TEST".gsub(/[aeiou]/i, '*')

# ----

m = "this is a test".match(/\b..\b/)
m[0]

# ----

m = "this is a test".match(/\b(.)(.)\b/)
m[0]

# ----

m[1]

# ----

m[2]

# ----

"this is a test".scan(/[aeiou]/)

# ----

"this is a test".scan(/\w+/)

# ----

"this is a test".split(/\s/)

# ----

10 / 3

# ----

10.to_f / 3

# ----

10.0 / 3

# ----

10 / Float(3)

# ----

(2 ** 24).class

# ----

(2 ** 30).class

# ----

2 ** 100

# ----

a = []
a.push(10)
a.push('test')
a.push(30)
a << 40

# ----

puts a[0]
puts a[1]
puts a[2]

# ----

fred = {
  'name' => 'Fred Elliott',
  'age' => 63,
  'gender' => 'male',
  'favorite painters' => ['Monet', 'Constable', 'Da Vinci']
}

# ----

puts fred['age']

# ----

puts fred['gender']

# ----

puts fred['favorite painters'].first

# ----

fred = {
  name: 'Fred Elliott',
  age: 63,
  gender: 'male',
  favorite_painters: ['Monet', 'Constable', 'Da Vinci']
}

# ----

people = {
  'fred' => {
    'name' => 'Fred Elliott',
    'age' => 63,
    'gender' => 'male',
    'favorite painters' => ['Monet', 'Constable', 'Da Vinci']
  },
  'janet' => {
    'name' => 'Janet S Porter',
    'age' => 68,
    'gender' => 'female'
  }
}

puts people['fred']['age']
puts people['janet']['gender']
puts people['janet'].inspect

# ----

lines = []
file_handle = File.open("/file/name/here", "r")

while line = file_handle.gets
  lines << line
end

file_handle.close

# ----

lines = File.readlines('/file/name/here')

# ----

require 'open-uri'
open('http://www.rubyinside.com/').readlines

# ----

require 'net/http'

Net::HTTP.start('www.rubyinside.com') do |http|
  req = Net::HTTP::Get.new('/test.txt')
  puts http.request(req).body
end

# ----

# place this code in mylib.rb
class MyLib
  def self.hello_world
    puts "Hello, world!"
  end
end

# ----

# and then you can load and use it like so
require_relative 'mylib'
MyLib.hello_world

# ----

# gem install rails

# ----

# gem uninstall rails

# ----

