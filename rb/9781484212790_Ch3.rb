5
1 + 2
"a" + "b" + "c"
100 - 5 * (2 - 1)
x + y

# ----

x = 10
puts x

# ----

x = 100
y = 10
puts x - y

# ----

x = 50
y = x * 100
x += y
puts x

# ----

age = 10
puts "You're too young to use this system" if age < 18

# ----

age = 24
puts "You're a teenager" if age > 12 && age < 20

# ----

age = 24
puts "You're NOT a teenager" unless age > 12 && age < 20

# ----

age = 24
puts "You're 24!" if age == 24

# ----

puts "You're a teenager" if age > 12 && age < 20

# ----

puts "You're either very young or very old" if age > 80 || age < 10

# ----

gender = "male"
age = 6
puts "A very young or old man" if gender == "male" && (age < 18 || age > 85)

# ----

x = 1
puts x
x += 1
puts x
x += 1
puts x
# ...
# ...

# ----

5.times do puts "Test" end

# ----

5.times { puts "Test" }

# ----

1.upto(5) { #...code to loop here...
}

10.downto(5) { #...code to loop here...
}

0.step(50, 5) { #...code to loop here...
}

# ----

1.upto(5) { |number| puts number }

# ----

1.upto(5) do |number|
 puts number
end

# ----

puts 10 / 3

# ----

puts 10.0 / 3.0

# ----

x = 10
y = 3
puts x / y

# ----

x = 10
y = 3
puts x.to_f / y.to_f

# ----

puts 5.7.to_i

# ----

Pi = 3.141592

# ----

Pi = 3.141592
Pi = 500

# ----

puts "Hello, world!"

# ----

puts "Hello, world!".class

# ----

x = "Test"
y = "String"
puts "Success!" if x + y == "TestString"

# ----

x = %q{This is a test
of the multi
line capabilities}

# ----

x = %q!This is a test
of the multi
line capabilities!

# ----

x = <<END_MY_STRING_PLEASE
This is the string
And a second line
END_MY_STRING_PLEASE

# ----

puts "Success!" if "Test" + "String" == "TestString"

# ----

puts "abc" * 5

# ----

puts "x" > "y"

# ----

puts "y" > "x"

# ----

puts "x".ord

# ----

puts "A".ord

# ----

puts 120.chr

# ----

x = 10
y = 20
puts "#{x} + #{y} = #{x + y}"

# ----

puts "100 * 5 = #{100 * 5}"

# ----

puts "#{x} + #{y} = #{x + y}"

# ----

10 + 20 = 30

# ----

x = "cat"
puts "The #{x} in the hat"

# ----

puts "It's a #{"bad " * 5}world"

# ----

my_string = "It's a #{"bad " * 5}world"
puts my_string

# ----

x = 10
y = 20
puts x.to_s + " + " + y.to_s + " = " + (x + y).to_s
puts "#{x} + #{y} = #{x + y}"

# ----

puts "This is a test".length

# ----

puts "foobar".sub('bar', 'foo')

# ----

puts "this is a test".gsub('i', '')

# ----

x = "This is a test"
puts x.sub(/^../, 'Hello')

# ----

x = "This is a test"
puts x.sub(/..$/, 'Hello')

# ----

"xyz".scan(/./) { |letter| puts letter }

# ----

"This is a test".scan(/../) { |x| puts x }

# ----

"This is a test".scan(/\w\w/) { |x| puts x }

# ----

"The car costs $1000 and the cat costs $10".scan(/\d+/) do |x|
  puts x
end

# ----

"The car costs $1000 and the cat costs $10".scan(/\d/) do |x|
 puts x
end

# ----

"This is a test".scan(/[aeiou]/) { |x| puts x }

# ----

"This is a test".scan(/[a-m]/) { |x| puts x }

# ----

puts "String has vowels" if "This is a test" =~ /[aeiou]/

# ----

puts "String contains no digits" unless "This is a test" =~ /[0-9]/

# ----

puts "String has vowels" if "This is a test".match(/[aeiou]/)

# ----

x = "This is a test".match(/(\w+) (\w+)/)
puts x[0]
puts x[1]
puts x[2]

# ----

x = [1, 2, 3, 4]

# ----

x = [1, 2, 3, 4]
puts x[2]

# ----

x[2] += 1
puts x[2]

# ----

x[2] = "Fish" * 3
puts x[2]

# ----

x = []

# ----

x = []
x << "Word"

# ----

x.push("Word")

# ----

x = []
x << "Word"
x << "Play"
x << "Fun"
puts x.pop
puts x.pop
puts x.length

# ----

x = ["Word", "Play", "Fun"]
puts x.join

# ----

x = ["Word", "Play", "Fun"]
puts x.join(', ')

# ----

puts "This is a test".scan(/\w/).join(',')

# ----

puts "Short sentence. Another. No more.".split(/\./).inspect

# ----

puts "Words with lots of spaces".split(/\s+/).inspect

# ----

p "Words with lots of spaces".split(/\s+/)

# ----

[1, "test", 2, 3, 4].each { |element| puts element.to_s + "X" }

# ----

[1, 2, 3, 4].collect { |element| element * 2 }

# ----

a = [1, "test", 2, 3, 4]
i = 0

while (i < a.length)
 puts a[i].to_s + "X"
 i += 1
end

# ----

x = [1, 2, 3]
y = ["a", "b", "c"]
z = x + y
p z

# ----

x = [1, 2, 3, 4, 5]
y = [1, 2, 3]
z = x - y
p z

# ----

x = []
puts "x is empty" if x.empty?

# ----

x = [1, 2, 3]
p x.include?("x")
p x.include?(3)

# ----

x = [1, 2, 3]
puts x.first
puts x.last

# ----

x = [1, 2, 3]
puts x.first(2).join("-")

# ----

x = [1, 2, 3]
p x.reverse

# ----

dictionary = { 'cat' => 'feline animal', 'dog' => 'canine animal' }

# ----

puts dictionary.size

# ----

puts dictionary['cat']

# ----

dictionary['cat'] = "fluffy animal"
puts dictionary['cat']

# ----

x = { "a" => 1, "b" => 2 }
x.each { |key, value| puts "#{key} equals #{value}" }

# ----

x = { "a" => 1, "b" => 2, "c" => 3 }
p x.keys

# ----

x = { "a" => 1, "b" => 2 }
x.delete("a")
p x

# ----

x = { "a" => 100, "b" => 20 }
x.delete_if { |key, value| value < 25 }
p x

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
 'age' => 55,
 'gender' => 'female'
 }
}

puts people['fred']['age']
puts people['janet']['gender']
p people['janet']

# ----

puts people['fred']['favorite painters'].length
puts people['fred']['favorite painters'].join(", ")

# ----

age = 10
puts "You're too young to use this system" if age < 18

# ----

age = 10
if age < 18
 puts "You're too young to use this system"
end

# ----

age = 10
if age < 18
 puts "You're too young to use this system"
 puts "So we're going to exit your program now"
 exit
end

# ----

age = 10
unless age >= 18
 puts "You're too young to use this system"
 puts "So we're going to exit your program now"
 exit
end

# ----

age = 19
if age < 21
 puts "You can't drink in most of the United States"
 if age >= 18
   puts "But you can in the United Kingdom!"
 end
end

# ----

age = 10
if age < 18
 puts "You're too young to use this system"
else
 puts "You can use this system"
end

# ----

age = 10
type = age < 18 ? "child" : "adult"
puts "You are a " + type

# ----

# <condition> ? <result if condition is true> : <result if condition is false>

# ----

age = 10
type = 'child' if age < 18
type = 'adult' unless age < 18
puts "You are a " + type

# ----

age = 10
if age < 18
 type = 'child'
else
 type = 'adult'
end
puts "You are a " + type

# ----

age = 10
puts "You are a " + (age < 18 ? "child" : "adult")

# ----

fruit = "orange"
color = "orange" if fruit == "orange"
color = "green" if fruit == "apple"
color = "yellow" if fruit == "banana"

# ----

fruit = "orange"
if fruit == "orange"
 color = "orange"
elsif fruit == "apple"
 color = "green"
elsif fruit == "banana"
 color = "yellow"
else
 color = "unknown"
end

# ----

fruit = "orange"
case fruit
 when "orange"
 color = "orange"
 when "apple"
 color = "green"
 when "banana"
 color = "yellow"
 else
 color = "unknown"
end

# ----

fruit = "orange"
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

# ----

1.upto(5) { |number| puts number }

# ----

x = 1
while x < 100
 puts x
 x = x * 2
end

# ----

x = 1
until x > 99
 puts x
 x = x * 2
end

# ----

i = 1
i = i * 2 until i > 1000
puts i

# ----

x = [1, 2, 3]
x.each { |y| puts y }

# ----

x = [1, 2, 3]
x.each do |y|
 puts y
end

# ----

def each_vowel(&code_block)
 %w{a e i o u}.each { |vowel| code_block.call(vowel) }
end

each_vowel { |vowel| puts vowel }

# ----

def each_vowel
 %w{a e i o u}.each { |vowel| yield vowel }
end

each_vowel { |vowel| puts vowel }

# ----

print_parameter_to_screen = lambda { |x| puts x }
print_parameter_to_screen.call(100)

# ----

puts Time.now

# ----

puts Time.now
puts Time.now - 10
puts Time.now + 86400

# ----

class Fixnum
  def seconds
    self
  end
  def minutes
    self * 60
  end
  def hours
    self * 60 * 60
  end
  def days
    self * 60 * 60 * 24
  end
end

puts Time.now
puts Time.now + 10.minutes
puts Time.now + 16.hours
puts Time.now - 7.days

# ----

year = 2016
month = 1
day = 16
hour = 12
min = 57
sec = 10
msec = 42
Time.local(year, month, day, hour, min, sec, msec)

# ----

Time.gm(year, month, day, hour, min, sec, msec)

# ----

Time.utc(year, month, day, hour, min, sec, msec)

# ----

Time.gm(2015, 05).to_i

# ----

epoch_time = Time.gm(2015, 5).to_i
t = Time.at(epoch_time)
puts t.year, t.month, t.day

# ----

rice_on_square = 1
64.times do |square|
  puts "On square #{square + 1} are #{rice_on_square} grain(s)"
  rice_on_square *= 2
end

# ----

puts 4611686018427387903.class

# ----

puts 4611686018427387904.class

# ----

x = ['A', 'B', 'C', 'D', 'E' .. and so on.. ]

# ----

('A'..'Z')

# ----

('A'..'Z').to_a.each { |letter| print letter }

# ----

('A'..'Z').each { |letter| print letter }

# ----

('A'..'Z').include?('R')

# ----

('A'..'Z').include?('r')

# ----

a = [2, 4, 6, 8, 10, 12]
p a[1..3]

# ----

a[1..3] = ["a", "b", "c"]
p a

# ----

current_situation = :good
puts "Everything is fine" if current_situation == :good
puts "PANIC!" if current_situation == :bad

# ----

current_situation = "good"
puts "Everything is fine" if current_situation == "good"
puts "PANIC!" if current_situation == "bad"

# ----

s = { :key => 'value' }

# ----

person1 = { :name => "Fred", :age => 20, :gender => :male }
person2 = { :name => "Laura", :age => 23, :gender => :female }

# ----

puts "12" + "10"
puts 12 + 10

# ----

puts "12".to_i + "10".to_i
puts 12.to_s + 10.to_s

# ----

