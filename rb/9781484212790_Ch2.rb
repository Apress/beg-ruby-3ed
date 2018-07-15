10.times do print "Hello, world!" end

# ----

print "test"

# ----

print "2+3 is equal to " + 2 + 3

# ----

print "2+3 is equal to "
print 2 + 3

# ----

print "2+3 is equal to " + (2 + 3).to_s

# ----

class Person
  attr_accessor :name, :age, :gender
end

# ----

# irb(main):001:0> class Person
# irb(main):002:?>   attr_accessor :name, :age, :gender
# irb(main):003:?>   end
# => nil
# irb(main):004:0>

# ----

person_instance = Person.new
# => #<Person:0x007fbb0c625f88>

# ----

person_instance.name = "Christine"

# ----

person_instance.age = 52
person_instance.gender = "female"

# ----

puts person_instance.name

# ----

x = 10

# ----

x * 2

# ----

class Cat
  attr_accessor :name, :age, :gender, :color
end

class Dog
  attr_accessor :name, :age, :gender, :color
end

class Snake
  attr_accessor :name, :age, :gender, :color
end

# ----

class Pet
  attr_accessor :name, :age, :gender, :color
end

class Cat < Pet
end

class Dog < Pet
end

class Snake < Pet
end

# ----

class Snake < Pet
  attr_accessor :length
end

# ----

# irb(main):001:0> snake = Snake.new
# irb(main):002:0> snake.name = "Sammy"
# irb(main):003:0> snake.length = 500
# irb(main):004:0> lassie = Dog.new
# irb(main):005:0> lassie.name = "Lassie"
# irb(main):006:0> lassie.age = 20
# irb(main):007:0> lassie.length = 10

# ----

class Dog < Pet
  def bark
    puts "Woof!"
  end
end

# ----

irb(main):0> a_dog = Dog.new
irb(main):0> a_dog.bark

# ----

puts 1 + 10

# ----

puts a_dog.class

# ----

puts 2.class

# ----

puts "Hello, world!"

# ----

Kernel.puts "Hello, world!"

# ----

class Dog
  def bark
    puts "Woof!"
  end
end

# ----

my_dog = Dog.new
my_dog.bark

# ----

class Dog
  def bark(i)
    i.times do
      puts "Woof!"
    end
  end
end

# ----

my_dog = Dog.new
my_dog.bark(3)

# ----

class Dog
  def say(a, b, c)
    puts a
    puts b
    puts c
  end
end

# ----

my_dog = Dog.new
my_dog.say("Dogs", "can't", "talk!")

# ----

puts "Hello"

# ----

puts("Hello")

# ----

puts "This is a test".length

# ----

puts "This is a test".upcase

# ----

def dog_barking
  puts "Woof!"
end

dog_barking

# ----

