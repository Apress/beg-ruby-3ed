def perimeter_of_square(side_length)
  side_length * 4
end

def area_of_square(side_length)
  side_length * side_length
end

def perimeter_of_triangle(side1, side2, side3)
  side1 + side2 + side3
end

def area_of_triangle(base_width, height)
  base_width * height / 2
end

# ----

class Shape
end

class Square < Shape
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end

  def perimeter
    @side_length * 4
  end
end

class Triangle < Shape
  def initialize(base_width, height, side1, side2, side3)
    @base_width = base_width
    @height = height
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def area
    @base_width * @height / 2
  end

  def perimeter
    @side1 + @side2 + @side3
  end
end

# ----

puts area_of_triangle(6,6)
puts perimeter_of_square(5)

# ----

my_square = Square.new(5)
my_triangle = Triangle.new(6, 6, 7.81, 7.81, 7.81)
puts my_square.area
puts my_square.perimeter
puts my_triangle.area
puts my_triangle.perimeter

# ----

class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end
end

# ----

a = Square.new(10)
b = Square.new(5)
puts a.area
puts b.area

# ----

x = 10
puts x

# ----

def basic_method
  puts x
end

x = 10
basic_method

# ----

def basic_method
  x = 50
  puts x
end

x = 10
basic_method
puts x

# ----

def basic_method
  puts $x
end

$x = 10
basic_method

# ----

class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end
end

# ----

a = Square.new(10)
b = Square.new(5)
puts a.area
puts b.area

# ----

class Square
  def initialize
    if defined?(@@number_of_squares)
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
    end
  end

  def self.count
    @@number_of_squares
  end
end
a = Square.new
b = Square.new
puts Square.count

# ----

class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end
end

# ----

class Square
  def self.test_method
    puts "Hello from the Square class!"
  end

  def test_method
    puts "Hello from an instance of class Square!"
  end

Square.test_method
Square.new.test_method

# ----

class Square
  def self.test_method
    puts "Hello from the Square class!"
  end
end

# ----

class Square
  def initialize
    if defined?(@@number_of_squares)
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
  end
end

  def self.count
    @@number_of_squares
  end
end

# ----

a = Square.new
puts Square.count
b = Square.new
puts Square.count
c = Square.new
puts Square.count

# ----

class ParentClass
  def method1
    puts "Hello from method1 in the parent class"
  end

  def method2
    puts "Hello from method2 in the parent class"
  end
end

class ChildClass < ParentClass
  def method2
    puts "Hello from method2 in the child class"
  end
end

my_object = ChildClass.new
my_object.method1

# ----

my_object.method2

# ----

class Person
  def initialize(name)
    @name = name
  end

  def name
    return @name
  end
end

class Doctor < Person
  def name
    "Dr. " + super
  end
end

# ----

x = "This is a test"
puts x.class

# ----

puts x.length
puts x.upcase

# ----

class String
  def length
    20
  end
end

# ----

puts "This is a test".length
puts "a".length
puts "A really long line of text".length

# ----

class Dog
  def talk
    puts "Woof!"
  end
end

my_dog = Dog.new
my_dog.talk

# ----

class Dog
  def talk
    puts "Howl!"
  end
end

my_dog.talk

# ----

a = "This is a test"
puts a.methods.join(' ')

# ----

class Person
  attr_accessor :name, :age
end

p = Person.new
p.name = "Fred"
p.age = 20
puts p.instance_variables

# ----

class Person
  def initialize(name)
    set_name(name)
  end

  def name
    @first_name + ' ' + @last_name
  end

  def set_name(name)
    first_name, last_name = name.split(/\s+/)
    set_first_name(first_name)
    set_last_name(last_name)
  end

  def set_first_name(name)
    @first_name = name
  end

  def set_last_name(name)
    @last_name = name
  end
end

# ----

p = Person.new("Fred Bloggs")
puts p.name

# ----

p = Person.new("Fred Bloggs")
p.set_last_name("Smith")
puts p.name

# ----

class Person
  def initialize(name)
    set_name(name)
  end

  def name
    @first_name + ' ' + @last_name
  end

  private

  def set_name(name)
    first_name, last_name = name.split(/\s+/)
    set_first_name(first_name)
    set_last_name(last_name)
  end

  def set_first_name(name)
    @first_name = name
  end

  def set_last_name(name)
    @last_name = name
  end
end

# ----

p = Person.new("Fred Bloggs")
p.set_last_name("Smith")

# ----

class Person
  def anyone_can_access_this
    ...
  end

  private
  def this_is_private
    ...
  end

  public
  def another_public_method
    ...
  end
end

# ----

class Person
  def anyone_can_access_this; ...; end

  def this_is_private; ...; end

  def this_is_also_private; ...; end

  def another_public_method; ...; end

  private :this_is_private, :this_is_also_private
end

# ----

class Person
  def initialize(age)
    @age = age
  end

  def age
    @age
  end

  def age_difference_with(other_person)
    (self.age - other_person.age).abs
  end

  protected :age
end

fred = Person.new(34)
chris = Person.new(25)
puts chris.age_difference_with(fred)
puts chris.age

# ----

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  def talk
    "Meaow!"
  end
end

class Dog < Animal
  def talk
    "Woof!"
  end
end

animals = [Cat.new("Flossie"), Dog.new("Clive"), Cat.new("Max")]
animals.each do |animal|
  puts animal.talk
end

# ----

puts 1000.to_s
puts [1,2,3].to_s
puts ({ :name => 'Fred', :age => 10 }).to_s

# ----

class Drawing
  class Line
  end

  class Circle
  end
end

# ----

class Drawing
  def self.give_me_a_circle
    Circle.new
  end

  class Line
  end

  class Circle
    def what_am_i
      "This is a circle"
    end
  end
end

a = Drawing.give_me_a_circle
puts a.what_am_i
a = Drawing::Circle.new
puts a.what_am_i
a = Circle.new
puts a.what_am_i

# ----

def circumference_of_circle(radius)
  2 * Pi * radius
end

Pi = 3.141592
puts circumference_of_circle(10)

# ----

Pi = 3.141592

class OtherPlanet
  Pi = 4.5
  def self.circumference_of_circle(radius)
    radius * 2 * Pi
  end
end

puts OtherPlanet.circumference_of_circle(10)

# ----

puts OtherPlanet::Pi

# ----

puts Pi

# ----

def random
  rand(1000000)
end

puts random

# ----

def random
  (rand(26) + 65).chr
end

# ----

require './number_stuff'
require './letter_stuff'

puts random

# ----

module NumberStuff
  def self.random
    rand(1000000)
  end
end

module LetterStuff
  def self.random
    (rand(26) + 65).chr
  end
end

puts NumberStuff.random
puts LetterStuff.random

# ----

module ToolBox
  class Ruler
    attr_accessor :length
  end
end

module Country
  class Ruler
    attr_accessor :name
  end
end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = "Ghengis Khan from Moskau"

# ----

module UsefulFeatures
  def class_name
    self.class.to_s
  end
end

class Person
  include UsefulFeatures
end

x = Person.new
puts x.class_name

# ----

module AnotherModule
  def do_stuff
    puts "This is a test"
  end
end

include AnotherModule
do_stuff

# ----

AnotherModule.do_stuff

# ----

[1,2,3,4,5].each { |number| puts number }

# ----

my_array = %w{this is a test of the longest word check}
longest_word = ''
my_array.each do |word|
  longest_word = word if longest_word.length < word.length
end
puts longest_word

# ----

my_array = %w{10 56 92 3 49 588 18}
highest_number = 0
my_array.each do |number|
  number = number.to_i
  highest_number = number if number > highest_number
end
puts highest_number

# ----

[1,2,3,4].collect { |i| i.to_s + "x" }

# ----

[1,2,3,4].detect { |i| i.between?(2,3) }

# ----

[1,2,3,4].select { |i| i.between?(2,3) }

# ----

[4,1,3,2].sort

# ----

[1,2,3,4].max

# ----

[1,2,3,4].min

# ----

class AllVowels
  VOWELS = %w{a e i o u}

  def each
    VOWELS.each { |v| yield v }
  end
end

# ----

x = AllVowels.new
x.each { |v| puts v }

# ----

class AllVowels
  include Enumerable

  VOWELS = %w{a e i o u}

  def each
    VOWELS.each { |v| yield v }
  end
end

# ----

x = AllVowels.new

# ----

x.collect { |i| i + "x" }

# ----

x.detect { |i| i > "j" }

# ----

x.select { |i| i > "j" }

# ----

x.sort

# ----

x.max

# ----

x.min

# ----

1 <=> 2

# ----

1 <=> 1

# ----

2 <=> 1

# ----

class Song
  include Comparable

  attr_accessor :length

  def <=>(other)
    @length <=> other.length
  end

  def initialize(song_name, length)
    @song_name = song_name
    @length = length
  end

end

a = Song.new('Rock around the clock', 143)
b = Song.new('Bohemian Rhapsody', 544)
c = Song.new('Minute Waltz', 60)

# ----

a < b

# ----

b >= c

# ----

c > a

# ----

a.between?(c,b)

# ----

module ToolBox
  class Ruler
    attr_accessor :length
  end
end

module Country
  class Ruler
    attr_accessor :name
  end
end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = "Ghengis Khan of Moskau"

# ----

include Country
c = Ruler.new
c.name = "King Henry VIII"

# ----

class Dungeon
  attr_accessor :player

  def initialize(player)
    @player = player
    @rooms = {}
  end
end

class Player
  attr_accessor :name, :location

  def initialize(player_name)
    @name = player_name
  end
end

class Room
  attr_accessor :reference, :name, :description, :connections

  def initialize(reference, name, description, connections)
    @reference = reference
    @name = name
    @description = description
    @connections = connections
  end
end

# ----

me = Player.new("Fred Bloggs")
my_dungeon = Dungeon.new(me)
puts my_dungeon.player.name

# ----

Person = Struct.new(:name, :gender, :age)
fred = Person.new("Fred", "male", 50)
chris = Person.new("Chris", "male", 25)
puts fred.age + chris.age

# ----

class Person
  attr_accessor :name, :gender, :age

  def initialize(name, gender, age)
    @name = name
    @gender = gender
    @age = age
  end
end

# ----

class Dungeon
  attr_accessor :player

  def initialize(player)
    @player = player
    @rooms = {}
  end
end

Player = Struct.new(:name, :location)
Room = Struct.new(:reference, :name, :description, :connections)

# ----

class Dungeon
  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end
end

# ----

my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :east => :largecave })

# ----

class Dungeon
  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms[reference]
  end
end

class Room
  def full_description
    @name + "\n\nYou are in " + @description
  end
end

# ----

class Dungeon
  attr_accessor :player

  def initialize(player)
    @player = player
    @rooms = {}
  end

  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms[reference]
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
end

class Player
  attr_accessor :name, :location

  def initialize(name)
    @name = name
  end
end

class Room
  attr_accessor :reference, :name, :description, :connections

  def initialize(reference, name, description, connections)
    @reference = reference
    @name = name
    @description = description
    @connections = connections
  end

  def full_description
    @name + "\n\nYou are in " + @description
  end
end

player = Player.new("Fred Bloggs")
my_dungeon = Dungeon.new(player)

# Add rooms to the dungeon
my_dungeon.add_room(:largecave,
                    "Large Cave",
                    "a large cavernous cave",
                    { :west => :smallcave })

my_dungeon.add_room(:smallcave,
                    "Small Cave",
                    "a small, claustrophobic cave",
                    { :east => :largecave })

# Start the dungeon by placing the player in the large cave
my_dungeon.start(:largecave)

# ----

def find_room_in_direction(direction)
  find_room_in_dungeon(@player.location).connections[direction]
end

def go(direction)
  puts "You go " + direction.to_s
  @player.location = find_room_in_direction(direction)
  show_current_description
end

# ----

my_dungeon.add_room(:largecave,
                    "Large Cave",
                    "a large cavernous cave",
                    { :west => :smallcave })

# ----

my_dungeon.show_current_description

# ----

my_dungeon.go(:west)

# ----

my_dungeon.go(:east)

# ----

