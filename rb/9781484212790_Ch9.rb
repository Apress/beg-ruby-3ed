a = gets
puts a

# ----

lines = readlines
puts lines.length

# ----

# ruby linecount.rb < textfile.txt

# ----

File.open("text.txt").each { |line| puts line }

# ----

File.new("text.txt", "r").each { |line| puts line }

# ----

File.open("text.txt") do |f|
   puts f.gets
end

# ----

f = File.new("text.txt", "r")
puts f.gets
f.close

# ----

class MyFile
  attr_reader :handle

  def initialize(filename)
    @handle = File.new(filename, "r")
  end

  def finished
    @handle.close
  end
end

f = MyFile.new("text.txt")
puts f.handle.gets
f.finished

# ----

# Fred Bloggs,Manager,Male,45
# Laura Smith,Cook,Female,23
# Debbie Watts,Professor,Female,38

# ----

File.open("text.txt").each { |line| puts line }

# ----

File.open("text.txt").each(',') { |line| puts line }

# ----

File.open("text.txt").each_byte { |byte| puts byte }

# ----

File.open("text.txt").each_char { |byte| puts byte }

# ----

File.open("text.txt") do |f|
  2.times { puts f.gets }
end

# ----

File.open("text.txt") do |f|
   2.times { puts f.gets(',') }
end

# ----

File.open("text.txt") do |f|
  2.times { puts f.getc }
end

# ----

puts File.open("text.txt").readlines.join("--")

# ----

File.open("text.txt") do |f|
  puts f.read(6)
end

# ----

data = File.read(“text.txt”)

# ----

array_of_lines = File.readlines(“text.txt”)

# ----

f = File.open("text.txt")
puts f.pos
puts f.gets
puts f.pos

# ----

f = File.open("text.txt")
f.pos = 8
puts f.gets
puts f.pos

# ----

File.open("text.txt", "w") do |f|
   f.puts "This is a test"
end

# ----

f = File.new("logfile.txt", "a")
f.puts Time.now
f.close

# ----

f = File.open("text.txt", "r+")
puts f.gets
f.puts "This is a test"
puts f.gets
f.close

# ----

f = File.open("text.txt", "r+")
f.putc "X"
f.close

# ----

f = File.open("text.txt", "r+")
f.write "123456"
f.close

# ----

File.new("text.txt", "r:utf-8").each { |line| puts line }

# ----

p File.open("text.txt", "r:iso-8859-1").external_encoding
p File.open("text.txt", "r").external_encoding

# ----

File.open("text.txt", "r:utf-8:iso-8859-1") do |f|
  p f.external_encoding
  first_line = f.gets
  p first_line.encoding
end

# ----

File.rename("file1.txt", "file2.txt")

# ----

File.delete("file1.txt")
File.delete("file2.txt", "file3.txt", "file4.txt")
File.unlink("file1.txt")

# ----

File.join('full', 'path', 'here', 'filename.txt')

# ----

File.join('full', 'path', 'here', 'filename.txt')

# ----

File.join(File::SEPARATOR , 'full', 'path', 'here', 'filename.txt')

# ----

File.expand_path("text.txt")

# ----

f = File.open("text.txt", "r+")
f.seek(-5, IO::SEEK_END)
f.putc "X"
f.close

# ----

f = File.open("text.txt", "r")
while a = f.getc
    puts a.chr
      f.seek(5, IO::SEEK_CUR)
end

# ----

puts File.mtime("text.txt")

# ----

t = File.mtime("text.txt")
puts t.hour
puts t.min
puts t.sec

# ----

puts "It exists!" if File.exist?("file1.txt")

# ----

class MyFile
  attr_reader :handle

  def initialize(filename)
    if File.exist?(filename)
      @handle = File.new(filename, "r")
    else
      return false
    end
  end
end

# ----

puts File.size("text.txt")

# ----

f = File.new("test.txt", "r")
while !f.eof?
  puts f.gets
end
f.close

# ----

Dir.chdir("/usr/bin")

# ----

puts Dir.pwd

# ----

Dir.chdir("/usr/bin")
puts Dir.pwd

# ----

puts Dir.entries("/usr/bin").join(' ')

# ----

Dir.foreach("/usr/bin") do |entry|
  puts entry
end

# ----

Dir["/usr/bin/*"]

# ----

Dir.mkdir("mynewdir")

# ----

Dir.mkdir("/mynewdir")
Dir.mkdir("c:\test")

# ----

Dir.delete("mynewdir")

# ----

require 'fileutils'
FileUtils.rm_f(directory_name)

# ----

require 'tmpdir'
puts Dir.tmpdir

# ----

require 'tmpdir'
tempfilename = File.join(Dir.tmpdir, "myapp.dat")
tempfile = File.new(tempfilename, "w")
tempfile.puts "This is only temporary"
tempfile.close
File.delete(tempfilename)

# ----

require 'tempfile'
f = Tempfile.new('myapp')
f.puts "Hello"
puts f.path
f.close

# ----

# Fred Bloggs,Manager,Male,45
# Laura Smith,Cook,Female,23
# Debbie Watts,Professor,Female,38

# ----

require 'csv'
CSV.open('text.txt').each do |person|
  p person
end

# ----

require 'csv'
people = CSV.parse(File.read('text.txt'))
puts people[0][0]
puts people[1][0]
puts people[2][0]

# ----

require ‘csv’
p CSV.read('text.txt')

# ----

require 'csv'
people = CSV.read('text.txt')
laura = people.find { |person| person[0] =~ /Laura/ }
p laura

# ----

young_people = people.find_all do |p|
  p[3].to_i.between?(20, 40)
end
p young_people

# ----

require 'csv'
people = CSV.read('text.txt')
laura = people.find { |person| person[0] =~ /Laura/ }
laura[0] = "Lauren Smith"

CSV.open('text.txt', 'w') do |csv|
  people.each do |person|
    csv << person
  end
end

# ----

class Person
   attr_accessor :name, :job, :gender, :age
end

# ----

fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45

laura = Person.new
laura.name = "Laura Smith"
laura.age = 23

# ----

require 'pstore'
store = PStore.new("storagefile")
store.transaction do
  store[:people] ||= Array.new
  store[:people] << fred
  store[:people] << laura
end

# ----

require 'pstore'
store = PStore.new("storagefile")
people = []
store.transaction do
  people = store[:people]
end

# At this point the Person objects inside people can be treated
# as totally local objects.
people.each do |person|
  puts person.name
end

# ----

require 'yaml'

class Person
  attr_accessor :name, :age
end

fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45

laura = Person.new
laura.name = "Laura Smith"
laura.age = 23
test_data = [ fred, laura ]

puts test_data.to_yaml

# ----

require 'yaml'

class Person
  attr_accessor :name, :age
end

yaml_string = <<END_OF_DATA
---
- !ruby/object:Person
  age: 45
  name: Jimmy
- !ruby/object:Person
  age: 23
  name: Laura Smith
END_OF_DATA

test_data = YAML.load(yaml_string)
puts test_data[0].name
puts test_data[1].name

# ----

require 'sqlite3'
puts "It's all okay!" if defined?(SQLite3::Database)

# ----

# CREATE TABLE table_name (
# column_name data_type options,
# column_name data_type options,
# ...,
# ...
# );

# ----

# CREATE TABLE people (
# id integer primary key,
# name varchar(50),
# job varchar(50),
# gender varchar(6),
# age integer);

# ----

# INSERT INTO people (name, age, gender, job) VALUES ("Chris Scott", 25, "Male", "Technician");

# ----

# INSERT INTO people VALUES ("Chris Scott", 25, "Male", "Technician");

# ----

# SELECT * FROM people;

# ----

# SELECT name FROM people;

# ----

# SELECT * FROM people WHERE id = 2;

# ----

# SELECT * FROM people WHERE name = "Chris Scott";

# ----

# SELECT * FROM people WHERE age >= 20 AND age <= 40;

# ----

# SELECT * FROM people ORDER BY name DESC;

# ----

# SELECT * FROM people WHERE age >= 20 AND age <= 40 ORDER BY age ASC;

# ----

# SELECT * FROM people ORDER BY name DESC LIMIT 5;

# ----

# SELECT * FROM people ORDER BY age DESC LIMIT 1;

# ----

# DELETE FROM people WHERE name="Chris";
# DELETE FROM people WHERE age > 100;
# DELETE FROM people WHERE gender = "Male" AND age < 50;

# ----

# DELETE FROM people WHERE age > 100 LIMIT 10;

# ----

# SELECT * FROM people WHERE name = "Chris";
# UPDATE people SET name = "Christopher" WHERE name = "Chris";

# ----

# UPDATE people SET name = "Christopher" WHERE name = "Chris";

# ----

# UPDATE people SET name = "Christopher", age = 44 WHERE name = "Chris";

# ----

# UPDATE people SET name = "Christopher" WHERE name = "Chris" AND age = 25;

# ----

# UPDATE people SET name = "Christopher";

# ----

require 'sqlite3'
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true

def disconnect_and_quit
  $db.close
  puts "Bye!"
  exit
end

def create_table
  puts "Creating people table"
  $db.execute %q{
    CREATE TABLE people (
    id integer primary key,
    name varchar(50),
    job varchar(50),
    gender varchar(6),
    age integer)
  }
end

def add_person
  puts "Enter name:"
  name = gets.chomp
  puts "Enter job:"
  job = gets.chomp
  puts "Enter gender:"
  gender = gets.chomp
  puts "Enter age:"
  age = gets.chomp
  $db.execute("INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)",➥
    name, job, gender, age)
end

def find_person
  puts "Enter name or ID of person to find:"
  id = gets.chomp

  person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?", id, id.to_i).first

  unless person
    puts "No result found"
    return
  end

  puts %Q{Name: #{person['name']}
Job: #{person['job']}
Gender: #{person['gender']}
Age: #{person['age']}}
end

loop do
  puts %q{Please select an option:

    1. Create people table
    2. Add a person
    3. Look for a person
    4. Quit}

  case gets.chomp
    when '1'
      create_table
    when '2'
      add_person
    when '3'
      find_person
    when '4'
      disconnect_and_quit
  end
end

# ----

# gem install sequel

# ----

# gem install pg

# ----

require 'sequel'
require 'pg'

DB = Sequel.connect('postgres://user:password@localhost/dbname')

DB.create_table :people do
  primary_key :id
  String :first_name
  String :last_name
  Integer :age
end

people = DB[:people]
people.insert( :first_name => "Fred", :last_name => "Bloggs", :age => 32 )

puts "There are #{people.count} people in the database"

people.each do |person|
  puts person[:first_name]
end

DB.fetch("SELECT * FROM people") do |row|
  puts row[:first_name]
end

# ----

person = Person.where(name: “Chris”).first
person.age = 50
person.save

# ----

# SELECT * FROM people WHERE name = "Chris";
# UPDATE people SET age = 50 WHERE name = "Chris";

# ----

