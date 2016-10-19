puts "Your program works!"

# ----

# ruby test.rb

# ----

#!/usr/bin/ruby

puts "Your program works!"

# ----

#!/usr/bin/env ruby

puts "Your program works!"

# ----

if RUBY_PLATFORM =~ /win32/
  puts "We're in Windows!"
elsif RUBY_PLATFORM =~ /linux/
  puts "We're in Linux!"
elsif RUBY_PLATFORM =~ /darwin/
  puts "We're in Mac OS X!"
elsif RUBY_PLATFORM =~ /freebsd/
  puts "We're in FreeBSD!"
else
  puts "We're running under an unknown operating system."
end

# ----

# irb(main):001:0> ENV.each {|e| puts e.join(': ') }

# ----

tmp_dir = '/tmp'
if ENV['OS'] =~ /Windows_NT/
  puts "This program is running under Windows NT/2000/XP!"
  tmp_dir = ENV['TMP']
elsif ENV['PATH'] =~ /\/usr/
  puts "This program has access to a UNIX-style file system!"
else
  puts "I cannot figure out what environment I'm running in!"
  exit
end

# [.. do something here ..]

# ----

p ARGV

# ----

# ruby argvtest.rb these are command line parameters

# ----

#!/usr/bin/env ruby
p ARGV

# ----

# ./argvtest.rb these are command line parameters

# ----

# cp /directory1/from_filename /directory2/destination_filename

# ----

#!/usr/bin/env ruby
from_filename = ARGV[0]
destination_filename = ARGV[1]

# ----

class String
  def vowels
    scan(/[aeiou]/i)
  end
end

# ----

"This is a test".vowels

# ----

require_relative 'string_extend'

# ----

Gem::Specification.new do |s|
  s.name = 'string_extend'
  s.version = '0.0.1'
  s.summary = "StringExtend adds useful features to the String class"
  s.platform = Gem::Platform::RUBY
  s.files = Dir.glob("**/**/**")
  s.test_files = Dir.glob("test/*_test.rb")
  s.author = "Your Name"
  s.email = "your-email-address@email.com"
  s.has_rdoc = false
s.required_ruby_version = '>= 1.8.2'
end

# ----

s.name = 'string_extend'

# ----

s.version = '0.0.1'

# ----

s.summary = "StringExtend adds useful features to the String class"

# ----

s.files = Dir.glob("**/**/**")

# ----

s.test_files = Dir.glob("test/*_test.rb")

# ----

s.required_ruby_version = '>= 1.8.2'

# ----

# gem build <spec file>

# ----

# gem build string_extend.gemspec

# ----

# bundle gem string_extend

# ----

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_extend/version'

Gem::Specification.new do |spec|
  spec.name          = "string_extend"
  spec.version       = StringExtend::VERSION
  spec.authors       = ["Peter Cooper"]
  spec.email         = ["git@peterc.org"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

# ----

# gem install gem_name

# ----

# gem push your_gems_filename-0.0.1.gem

# ----

#!/usr/bin/ruby

puts "Content-type: text/html\n\n"
puts "<html><body>This is a test</body></html>"

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

text = cgi['text']

puts cgi.header
puts "<html><body>#{text.reverse}</body></html>"

# ----

#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new

from = cgi['from'].to_i
to = cgi['to'].to_i

number = rand(to-from+1) + from

puts cgi.header
puts "<html><body>#{number}</body></html>"

# ----

# <form method="POST" action="http://www.example.com/test.cgi">
# For a number between <input type="text" name="from" value="" /> and
# <input type="text" name="to" value="" /> <input type="submit"
# value="Click here!" /></form>

# ----

require 'webrick'

server = WEBrick::GenericServer.new( :Port => 1234 )

trap("INT"){ server.shutdown }

server.start do |socket|
   socket.puts Time.now
end

# ----

require 'webrick'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
     response.status = 200
     response.content_type = "text/plain"
     response.body = "Hello, world!"
  end
end

server = WEBrick::HTTPServer.new( :Port => 1234 )
server.mount "/", MyServlet
trap("INT"){ server.shutdown }
server.start

# ----

response.body = "You are trying to load #{request.path}"

# ----

require 'webrick'

class MyNormalClass
  def MyNormalClass.add(a, b)
    a.to_i + b.to_i
  end
  def MyNormalClass.subtract(a,b)
    a.to_i - b.to_i
  end
end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    if request.query['a'] && request.query['b']
      a = request.query['a']
      b = request.query['b']
      response.status = 200
      response.content_type = 'text/plain'
      result = nil

      case request.path
        when '/add'
          result = MyNormalClass.add(a,b)
        when '/subtract'
          result = MyNormalClass.subtract(a,b)
        else
          result = "No such method"
      end

      response.body = result.to_s + "\n"
    else
      response.status = 400
      response.body = "You did not provide the correct parameters"
    end
  end
end

server = WEBrick::HTTPServer.new(:Port => 1234)
server.mount '/', MyServlet
trap('INT'){ server.shutdown }
server.start
