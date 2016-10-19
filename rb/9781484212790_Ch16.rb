require 'abbrev'
require 'pp'

pp Abbrev::abbrev(%w{Peter Patricia Petal Petunia})

# ----

require 'abbrev'

abbrevs = %w{Peter Paul Patricia Petal Pauline}.abbrev
puts "Please enter your name:"
name = gets.chomp

if a = abbrevs.find { |a, n| a.downcase == name.downcase }
  puts "Did you mean #{a.join(' or ')}?"
  name = gets.chomp
end

# ----

require 'base64'
puts Base64.encode64('testing')

# ----

require 'base64'
puts Base64.encode64(File.read('/bin/bash'))

# ----

require 'base64'
puts Base64.decode64(Base64.encode64('testing'))

# ----

require 'base64'
require 'zlib'

module Base64
  def Base64.new_encode64(data)
    encode64(Zlib::Deflate.deflate(data))
  end
  def Base64.new_decode64(data)
    Zlib::Inflate.inflate(decode64(data))
  end
end

test_data = 'this is a test' * 100

data = Base64.encode64(test_data)
puts "The uncompressed data is #{data.length} bytes long in Base64"

data = Base64.new_encode64(test_data)
puts "The compressed data is #{data.length} bytes long in Base64"

# ----

require 'benchmark'
puts Benchmark.measure { 10000000.times { rand } }

# ----

require 'benchmark'

TIMES = 10000000
Benchmark.bm do |b|
  b.report("times") { TIMES.times { rand } }
  b.report("upto") { 1.upto(TIMES) { rand } }
  b.report("loop") {
    i = 0
    loop do
      rand
      i += 1
      break if i == TIMES
    end
  }
end

# ----

#!/usr/bin/ruby

require 'cgi'

cgi = CGI.new

puts cgi.header
puts "<html><body>This is a test</body></html>"

# ----

#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new

cgi.out do
  "<html><body>This is a test</body></html>"
end

# ----

#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new

text = cgi['text']
puts cgi.header
puts "<html><body>#{text.reverse}</body></html>"

# ----

#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new

from = cgi['from'].to_i
to = cgi['to'].to_i

number = rand(to - from + 1) + from

puts cgi.header
puts "<html><body>#{number}</body></html>"

# ----

# <form method="POST" action="/test.cgi">
# For a number between <input type="text" name="from" value="" /> and
# <input type="text" name="to" value="" /> <input type="submit"
# value="Click here!" /></form>

# ----

#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new

cookie = cgi.cookies['count']
# If there is no cookie, create a new one
if cookie.empty?
  count = 1
  cookie = CGI::Cookie.new('count', count.to_s)
else
  # If there is a cookie, retrieve its value (note that cookie.value results
  # in an Array)
  count = cookie.value.first

  # Now send back an increased amount for the cookie to store
  cookie.value = (count.to_i + 1).to_s
end

cgi.out("cookie" => [cookie]) do
  "<html><body>You have loaded this page #{count} times</body></html>"
end

# ----

#!/usr/bin/ruby
require 'cgi'
require 'cgi/session'
require 'cgi/session/pstore'

cgi = CGI.new
session = CGI::Session.new(cgi,
                           :session_key => 'count_app',
                           :database_manager => CGI::Session::PStore,
                           :prefix => 'session_id'
                           )

if session['count'] && session['count'].to_i > 0
  session['count'] = (session['count'].to_i + 1).to_s
else
  session['count'] = 1
end

cgi.out do
  "<html><body>You have loaded this page #{session['count']} times</body></html>"
end

session.close

# ----

require 'chronic'
puts Chronic.parse('last tuesday 5am')

# ----

puts Chronic.parse('last tuesday 5:33')

# ----

puts Chronic.parse('last tuesday lunchtime')

# ----

puts Chronic.parse('june 29th at 1am')

# ----

puts Chronic.parse('in 3 years')

# ----

puts Chronic.parse('sep 23 2033')

# ----

puts Chronic.parse('2003-11-10 01:02')

# ----

require 'digest/sha1'
puts Digest::SHA1.hexdigest('password')

# ----

require 'digest/sha1'
puts Digest::SHA1.hexdigest('test' * 1000)

# ----

require 'digest/md5'
puts Digest::MD5.hexdigest('test' * 1000)

# ----

require 'digest/sha1'

puts "Enter the password to use this program:"
password = gets
if Digest::SHA1.hexdigest(password) == ➥
                         '24b63c0840ec7e58e5ab50d0d4ca243d1729eb65'
  puts "You've passed!"
else
  puts "Wrong!"
  exit
end

# ----

Digest::SHA1.digest('test' * 1000)

# ----

Digest::SHA1.digest('test' * 1000).each_byte do |byte|
  print byte, "-"
end

# ----

require 'base64'
require 'digest/sha1'

puts Digest::SHA1.hexdigest('test')
puts Base64.encode64(Digest::SHA1.digest('test'))

# ----

# <% 1.upto(5) do |i| %>
#   <p>This is iteration <%= i %></p>
# <% end %>

# ----

require 'erb'
template = <<EOF
<% 1.upto(5) do |i| %>
  <p>This is iteration <%= i %></p>
<% end %>
EOF
puts ERB.new(template).result

# ----

ERB.new(template).run

# ----

require 'erb'

array_of_stuff = %w{this is a test}

template = <<EOF
<% array_of_stuff.each_with_index do |item, index| %>
  <p>Item <%= index %>: <%= item %></p>
<% end %>
EOF
puts ERB.new(template).result(binding)

# ----

require 'erb'

template = <<EOF
Let's try to do something crazy like access the filesystem..
<%= `ls` %>
EOF

puts ERB.new(template, 3).result # Using safe level 3!

# ----

# {"name":"Maggie Robertson","age":37,"interests":["Golf","Bridge","Food"]}

# ----

require 'json'

json_data = %{
  {"name":"Maggie Robertson","age":37,"interests":["Golf","Bridge","Food"]}
}

obj = JSON.load(json_data)
puts obj.class
puts obj.keys

# ----

require 'json'

person = {
  name: 'Maggie Robertson',
  age: 37,
  interests: ['Golf', 'Bridge', 'Food']
}

puts person.to_json

# ----

require 'logger'
logger = Logger.new(STDERR)

# ----

logger = Logger.new('mylogfile.log')
logger = Logger.new('/tmp/some_log_file.log')

# ----

logger = Logger.new('mylogfile.log', 'daily')
logger = Logger.new('mylogfile.log', 'weekly')
logger = Logger.new('mylogfile.log', 'monthly')

# ----

logger = Logger.new('mylogfile.log', 10, 100000)

# ----

logger.sev_threshold = Logger::FATAL

# ----

logger.sev_threshold = Logger::DEBUG

# ----

require 'logger'
logger = Logger.new(STDOUT)

logger.debug "test"
logger.info "test"
logger.fatal "test"

# ----

logger.info("myprog") { "test" }

# ----

logger.add(Logger::FATAL) { "message here" }

# ----

logger.close

# ----

require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.cnn.com/'))

doc.css('p').each do |para|
  puts para.inner_text
end

# ----

require 'pp'

# ----

person1 = { :name => "Peter", :gender => :male }
person2 = { :name => "Laura", :gender => :female }
people = [person1, person2, person1, person1, person1]
puts people.inspect

# ----

pp people

# ----

require 'pp'

class TestClass
  def initialize(count)
    @@a = defined?(@@a) ? @@a + 1 : 0
    @c = @@a
    @d = [:a => {:b => count }, :c => :d] * count end
  end

pp TestClass.new(2), STDOUT, 60
pp TestClass.new(3), $>, 60
pp TestClass.new(4), $>, 60

# ----

pp TestClass.new(4), $>, 60

# ----

gem install redcarpet

# ----

markdown_text = %{
This is a title
===============

Here is some _text_ that's formatted according to [Markdown][1]
*specifications*. And how about a quote?

 [1]: http://daringfireball.net/projects/markdown/

> This section is a quote.. a block quote
> more accurately..

Lists are also possible:

* Item 1
* Item 2
* Item 3 }

require 'redcarpet'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
puts markdown.render(markdown_text)

# ----

require 'strscan'
string = StringScanner.new "This is a test"
puts string.scan(/\w+/)
puts string.scan(/\s+/)
puts string.scan(/\w+/)
puts string.scan(/\s+/)
puts string.rest

# ----

puts string.scan(/\w+/)
puts string.scan(/\w+/)
puts string.scan(/\w+/)
puts string.scan(/\w+/)

# ----

puts string.scan(/\w+\s*/)
puts string.scan(/\w+\s*/)
puts string.scan(/\w+\s*/)
puts string.scan(/\w+\s*/)

# ----

string = StringScanner.new "I want to live to be 100 years old!"
puts string.scan(/\w+/)
puts string.scan_until(/\d+/)

# ----

string = StringScanner.new("This is a test")
puts string.scan_until(/\w+/)
puts string.scan_until(/\w+/)
puts string.scan_until(/\w+/)
puts string.scan_until(/\w+/)

# ----

string = StringScanner.new "I want to live to be 100 years old!"
puts string.scan(/\w+/)
string.unscan
puts string.scan_until(/\d+/)
string.unscan
puts string.scan_until(/live/)

# ----

string = StringScanner.new "I want to live to be 100 years old!"
string.scan(/\w+/)
string.unscan
puts string.pos
string.scan_until(/\d+/)
puts string.pos
string.unscan string.scan_until(/live/)
puts string.pos

# ----

string = StringScanner.new "I want to live to be 100 years old!"
string.pos = 12
puts string.scan(/...../)

# ----

require 'tempfile'
f = Tempfile.new('myapp')
f.puts "Hello"
puts f.path f.close
f.close
f.open

# ----

require 'tempfile'
f = Tempfile.new('myapp')
f.puts "Hello" f.close
f.open
puts f.read
f.close!

# ----

require 'tempfile'

f = Tempfile.new('myapp')
f.puts "Hello"
f.pos = 0
f.print "Y"
f.pos = f.size - 1
f.print "w"
f.flush f.pos = 0
puts f.read
f.close!

# ----

f = Tempfile.new('myapp', '/my/secret/temporary/directory')

# ----

require 'tempfile'

Tempfile.open('myapp') do |f|
  f.puts "Hello" f.pos = 0 f.print "Y"
  f.pos = f.size - 1
  f.print "w"
  f.flush
  f.pos = 0
  puts f.read
end

# ----

require 'uri'
puts URI.extract('Check out http://www.rubyinside.com/ or e-mail ➥
mailto:me@privacy.net').inspect

# ----

require 'uri'
puts URI.extract('http://www.rubyinside.com/ and mailto:me@privacy.net', ➥
['http']).inspect

# ----

require 'uri'

email = %q{Some cool Ruby sites are http://www.ruby-lang.org/ and ➥
http://www.rubyinside.com/ and http://redhanded.hobix.com/}

URI.extract(email, ['http', 'https']) do |url|
  puts "Fetching URL #{url}"
  # Do some work here...
end

# ----

URI.parse('http://www.rubyinside.com/')

# ----

require 'uri'
a = URI.parse('http://www.rubyinside.com/')
puts a.scheme
puts a.host
puts a.port
puts a.path
puts a.query

# ----

require 'uri'
url = 'http://www.x.com:1234/test/1.html?x=y&y=z#top'
puts URI.parse(url).port
puts URI.parse(url).path
puts URI.parse(url).query
puts URI.parse(url).fragment

# ----

u = URI('http://www.test.com/')

# ----

URI.split('http://www.x.com:1234/test/1.html?x=y&y=z#top')

# ----

require 'uri'
u = URI::HTTP.build( :host => 'rubyinside.com', :path => '/' )
puts u.to_s
puts u.request_uri

# ----

ftp_url = URI::FTP.build( :userinfo => 'username:password',
:host => 'ftp.example.com',
:path => '/pub/folder',
:typecode => 'a')

puts ftp_url.to_s

# ----

require 'uri'
my_url = "http://www.test.com/something/test.html"
url = URI.parse(my_url)
url.host = "www.test2.com"
url.port = 1234
puts url.to_s

# ----

require 'zlib'

test_text = 'this is a test string' * 100
puts "Original string is #{test_text.length} bytes long"
compressed_text = Zlib::Deflate.deflate(test_text)
puts "Compressed data is #{compressed_text.length} bytes long"

# ----

require 'zlib'
test_text = 'this is a test string' * 100
puts "Original string is #{test_text.length} bytes long" compressed_text = Zlib::Deflate.deflate(test_text)
puts "Compressed data is #{compressed_text.length} bytes long"
uncompressed_text = Zlib::Inflate.inflate(compressed_text)
puts "Uncompressed data is back to #{uncompressed_text.length} bytes in length"

# ----

require 'zlib'

Zlib::GzipWriter.open('my_compressed_file.gz') do |gz|
  gz.write 'This data will be compressed automatically!'
end

Zlib::GzipReader.open('my_compressed_file.gz') do |my_file|
  puts my_file.read
end

# ----

