class WordPlay
end

# ----

class String
  def sentences
    gsub(/\n|\r/, ' ').split(/\.\s*/)
  end
end

# ----

p %q{Hello. This is a test of
basic sentence splitting. It
even works over multiple lines.}.sentences

# ----

class String
  def words
    scan(/\w[\w\'\-]*/)
  end
end

p "This is a test of words' capabilities".words

# ----

p %q{Hello. This is a test of
basic sentence splitting. It
even works over multiple lines}.sentences[1].words[3]

# ----

def self.best_sentence(sentences, desired_words)
  ranked_sentences = sentences.sort_by do |s|
    s.words.length  (s.downcase.words  desired_words).length
  end

  ranked_sentences.last
end

# ----

def self.switch_pronouns(text)
  text.gsub(/\b(I am|You are|I|You|Your|My)\b/i) do |pronoun|
    case pronoun.downcase
      when "i"
        "you"
      when "you"
        "I"
      when "i am"
        "you are"
      when "you are"
        "i am"
      when "your"
        "my"
      when "my"
        "your"
    end
  end
end

# ----

WordPlay.switch_pronouns("Your cat is fighting with my cat")

# ----

WordPlay.switch_pronouns(You are my robot)

# ----

WordPlay.switch_pronouns("I gave you life")

# ----

def self.switch_pronouns(text)
  text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|
    case pronoun.downcase
      when "i"
        "you"
      when "you"
        "me"
      when "me"
        "you"
      when "i am"
        "you are"
      when "you are"
        "i am"
      when "your"
        "my"
      when "my"
        "your"
    end
  end.sub(/^me\b/i, 'i')
end

# ----

WordPlay.switch_pronouns('Your cat is fighting with my cat')

# ----

WordPlay.switch_pronouns('My cat is fighting with you')

# ----

WordPlay.switch_pronouns('You are my robot')

# ----

WordPlay.switch_pronouns('I gave you hope')

# ----

WordPlay.switch_pronouns('You gave me hope')

# ----

while input = gets
  puts '>> ' + WordPlay.switch_pronouns(input).chomp + '?'
end

# ----

require 'minitest/autorun'
require_relative 'wordplay'

class TestWordPlay < Minitest::Test
end

# ----

def test_sentences
  assert_equal(["a", "b", "c d", "e f g"], "a. b. c d. e f g.".sentences)

  test_text = %q{Hello. This is a test
of sentence separation. This is the end
of the test.}
  assert_equal("This is the end of the test", test_text.sentences[2])
end

# ----

def test_words
  assert_equal(%w{this is a test}, "this is a test".words)
  assert_equal(%w{these are mostly words}, "these are, mostly, words".words)
end

# ----

def test_sentence_choice
  assert_equal('This is a great test',
               WordPlay.best_sentence(['This is a test',
                                                         'This is another test',
                                                         'This is a great test'],
                                                       %w{test great this}))
  assert_equal('This is a great test',
                         WordPlay.best_sentence(['This is a great test'],
                                                                  %w{still the best}))
end

# ----

def test_basic_pronouns
  assert_equal("i am a robot", WordPlay.switch_pronouns("you are a robot"))
  assert_equal("you are a person", WordPlay.switch_pronouns("i am a person"))
  assert_equal("i love you", WordPlay.switch_pronouns("you love me"))
end

# ----

def test_mixed_pronouns
  assert_equal("you gave me life", WordPlay.switch_pronouns("i gave you life"))
  assert_equal("i am not what you are", WordPlay.switch_pronouns("you are not➥
what i am"))
  assert_equal("i annoy your dog", WordPlay.switch_pronouns("you annoy my dog"))
end

# ----

def test_complex_pronouns
  assert_equal("yes, i rule", WordPlay.switch_pronouns("yes, you rule"))
  assert_equal("why do i cry", WordPlay.switch_pronouns("why do you cry"))
end

# ----

class String
  def sentences
    self.gsub(/\n|\r/, ' ').split(/\.\s*/)
  end

  def words
    self.scan(/\w[\w\'\-]*/)
  end
end

class WordPlay
  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|
      case pronoun.downcase
        when "i"
          "you"
        when "you"
          "me"
        when "me"
          "you"
        when "i am"
          "you are"
        when "you are"
          "i am"
        when "your"
          "my"
        when "my"
          "your"
      end
    end.sub(/^me\b/i, 'i')
  end
  def self.best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - desired_words).length
    end

    ranked_sentences.last
  end
end

# ----

require 'minitest/autorun'
require_relative 'wordplay'

# Unit testing class for the WordPlay library
class TestWordPlay < Minitest::Test

  # Test that multiple sentence blocks are split up into individual
  # words correctly
  def test_sentences
    assert_equal(["a", "b", "c d", "e f g"], "a. b. c d. e f g.".sentences)

    test_text = %q{Hello. This is a test
of sentence separation. This is the end
of the test.}
    assert_equal("This is the end of the test", test_text.sentences[2])
  end

  # Test that sentences of words are split up into distinct words correctly
  def test_words
    assert_equal(%w{this is a test}, "this is a test".words)
    assert_equal(%w{these are mostly words}, "these are, mostly, words".words)
  end

  # Test that the correct sentence is chosen, given the input
  def test_sentence_choice
    assert_equal('This is a great test',
                 WordPlay.best_sentence(['This is a test',
                                         'This is another test',
                                         'This is a great test'],
                                        %w{test great this}))
    assert_equal('This is a great test',
                 WordPlay.best_sentence(['This is a great test'],
                                        %w{still the best}))
  end

  # Test that basic pronouns are switched by switch_pronouns
  def test_basic_pronouns
    assert_equal("i am a robot", WordPlay.switch_pronouns("you are a robot"))
    assert_equal("you are a person", WordPlay.switch_pronouns("i am a person"))
    assert_equal("i love you", WordPlay.switch_pronouns("you love me"))
  end

  # Test more complex sentence switches using switch_pronouns
  def test_mixed_pronouns
    assert_equal("you gave me life",
                 WordPlay.switch_pronouns("i gave you life"))

    assert_equal("i am not what you are",
                 WordPlay.switch_pronouns("you are not what i am"))
  end

end

# ----

require_relative 'bot'

bot = Bot.new(:name => "Botty", :data_file => "botty.bot")

puts bot.greeting
while input = gets and input.chomp != 'goodbye'
  puts ">> " + bot.response_to(input)
end
puts bot.farewell

# ----

bot_data = {
  :presubs => [
    ["dont", "don't"],
    ["youre", "you're"],
    ["love", "like"]
  ],

  :responses => {
    :default   => [
                    "I don't understand.",
                    "What?",
                    "Huh?"
                  ],
    :greeting  => ["Hi. I'm [name]. Want to chat?"],
    :farewell  => ["Good bye!"],
    'hello'    => [
                    "How's it going?",
                    "How do you do?"
                  ],
    'i like *' => [
                    "Why do you like *?",
                    "Wow! I like * too!"
                  ]
  }
}

# ----

require 'yaml'

bot_data = {
  :presubs => [
    ["dont", "don't"],
    ["youre", "you're"],
    ["love", "like"]
  ],
  :responses => {
    :default       => [
                        "I don't understand.",
                        "What?",
                        "Huh?"
                      ],
    :greeting      => ["Hi. I'm [name]. Want to chat?"],
    :farewell      => ["Good bye!"],
    'hello'        => [
                        "How's it going?",
                        "How do you do?"
                      ],
    'i like *'     => [
                        "Why do you like *?",
                        "Wow! I like * too!"
                      ]
  }
}

# Show the user the YAML data for the bot structure
puts bot_data.to_yaml

# Write the YAML data to file
f = File.open(ARGV.first || 'bot_data', "w")
f.puts bot_data.to_yaml
f.close

# ----

require 'yaml'
require_relative 'wordplay'

class Bot
  attr_reader :name

  def initialize(options)
    @name = options[:name] || "Unnamed Bot"
    begin
      @data = YAML.load(File.read(options[:data_file]))
    rescue
      raise "Can't load bot data"
    end
  end
end

# ----

def greeting
  @data[:responses][:greeting][rand(@data[:responses][:greeting].length)]
end

def farewell
  @data[:responses][:farewell][rand(@data[:responses][:farewell].length)]
end

# ----

private

def random_response(key)
  random_index = rand(@data[:responses][key].length)
  @data[:responses][key][random_index].gsub(/\[name\]/, @name)
end

# ----

def greeting
  random_response :greeting
end

def farewell
  random_response :farewell
end

# ----

def response_to(input)
end

# ----

def response_to(input)
  prepared_input = preprocess(input).downcase
end

# ----

private

def preprocess(input)
  perform_substitutions input
end

# ----

def perform_substitutions(input)
  @data[:presubs].each { |s| input.gsub!(s[0], s[1]) }
  input
end

# ----

def response_to(input)
  prepared_input = preprocess(input.downcase)
  sentence = best_sentence(prepared_input)
end

# ----

def best_sentence(input)
  hot_words = @data[:responses].keys.select do |k|
    k.class == String && k =~ /^\w+$/
  end

  WordPlay.best_sentence(input.sentences, hot_words)
end

# ----

def best_sentence(input)
  input.sentences.first
end

# ----

def best_sentence(input)
  input.sentences.sort_by { |s| s.length }.last
end

# ----

def response_to(input)
  prepared_input = preprocess(input.downcase)
  sentence = best_sentence(prepared_input)
  responses = possible_responses(sentence)
end

# ----

def possible_responses(sentence)
  responses = []

  # Find all patterns to try to match against
  @data[:responses].keys.each do |pattern|
    next unless pattern.is_a?(String)

    # For each pattern, see if the supplied sentence contains
    # a match. Remove substitution symbols (*) before checking.
    # Push all responses to the responses array.
    if sentence.match('\b' + pattern.gsub(/\*/, '') + '\b')
      responses << @data[:responses][pattern]
    end
  end

  # If there were no matches, add the default ones
  responses << @data[:responses][:default] if responses.empty?

  # Flatten the blocks of responses to a flat array
  responses.flatten
end

# ----

def response_to(input)
  prepared_input = preprocess(input.downcase)
  sentence = best_sentence(prepared_input)
  responses = possible_responses(sentence)
  responses[rand(responses.length)]
end

# ----

'i like *' => [
                "Why do you like *?",
                "Wow! I like * too!"
                ]

# ----

def possible_responses(sentence)
  responses = []

# Find all patterns to try to match against
  @data[:responses].keys.each do |pattern|
    next unless pattern.is_a?(String)

    # For each pattern, see if the supplied sentence contains
    # a match. Remove substitution symbols (*) before checking.
    # Push all responses to the responses array.
    if sentence.match('\b' + pattern.gsub(/\*/, '') + '\b')
      # If the pattern contains substitution placeholders,
      # perform the substitutions
      if pattern.include?('*')
        responses << @data[:responses][pattern].collect do |phrase|
          # First, erase everything before the placeholder
          # leaving everything after it
          matching_section = sentence.sub(/^.*#{pattern}\s+/, '')

          # Then substitute the text after the placeholder, with
          # the pronouns switched
          phrase.sub('*', WordPlay.switch_pronouns(matching_section))
        end
      else
        # No placeholders? Just add the phrases to the array
        responses << @data[:responses][pattern]
      end
    end
  end

  # If there were no matches, add the default ones
  responses << @data[:responses][:default] if responses.empty?

  # Flatten the blocks of responses to a flat array
  responses.flatten
end

# ----

require 'yaml'

bot_data = {
  :presubs => [
    ["dont", "do not"],
    ["don't", "do not"],
    ["youre", "you're"],
    ["love", "like"],
    ["apologize", "are sorry"],
    ["dislike", "hate"],
    ["despise", "hate"],
    ["yeah", "yes"],
    ["mom", "family"]
  ],
  :responses => {
    :default     => [
                    "I don't understand.",
                    "What?",
                    "Huh?",
                    "Tell me about something else.",
                    "I'm tired of this. Change the subject."
                    ],
    :greeting    => [
                    "Hi. I'm [name]. Want to chat?",
                    "What's on your mind today?",
                    "Hi. What would you like to talk about?"
                    ],
    :farewell    => ["Good bye!", "Au revoir!"],
    'hello'      => [
                    "How's it going?",
                    "How do you do?",
                    "Enough of the pleasantries!"
                    ],
    'sorry'      => ["There's no need to apologize."],
    'different'  => [
                    "How is it different?",
                    "What has changed?"
                    ],
    'everyone *' => ["You think everyone *?"],
    'do not know'=> ["Are you always so indecisive?"],
    'yes' => [
                    "At least you're positive about something!",
                    "Great."
                    ],
    'family'     => ["Tell me about your family"],
    'you are *'  => [
                    "What makes you think I am *?",
                    "Are you so sure I am *?"
                    ],
    'i am *'     => [
                    "Is it normal for you to be *?",
                    "Do you like being *?"
                    ],
    'i do not *' => ["Why don't you *?"],
    'what'       => ["Why do you ask?", "Why?", "I don't know. Do you?"],
    'no'         => [
                    "Really?",
                    "Fair enough."
                    ],
    'why does *' => [
                    "I don't know why *",
                    "Do you already know the answer?"
                    ],
    'why can\'t i *' => ["Do you want to *?"],
    'why can\'t you *' => ["Do you want me to *?"],
    'hates *'   => [
                   "Why do you think they hate *?"
                   ],
    'hate *'    => [
                   "Why don't you like *?",
                   "Why the dislike of *?"
                   ],
    'i like *'  => [
                   "Why do you like *?",
                   "Wow! I like * too!"
                   ]
  }
}
# Show the user the YAML data for the bot structure
puts bot_data.to_yaml

# Write the YAML data to file
f = File.open(ARGV.first || 'bot_data', "w")
f.puts bot_data.to_yaml
f.close

# ----

require_relative 'bot'

bot = Bot.new(:name => 'Fred', :data_file => 'fred.bot')

puts bot.greeting

while input = gets and input.chomp != 'end'
  puts '>> ' + bot.response_to(input)
end

puts bot.farewell

# ----

require 'yaml'
require_relative 'wordplay'

# A basic implementation of a chatterbot
class Bot
  attr_reader :name

  # Initializes the bot object, loads in the external YAML data
  # file and sets the bot's name. Raises an exception if
  # the data loading process fails.
  def initialize(options)
    @name = options[:name] || "Unnamed Bot"
    begin
      @data = YAML.load(File.open(options[:data_file]).read)
    rescue
      raise "Can't load bot data"
    end
  end

  # Returns a random greeting as specified in the bot's data file
  def greeting
    random_response(:greeting)
  end

  # Returns a random farewell message as specified in the bot's
  # data file
  def farewell
    random_response(:farewell)
  end

  # Responds to input text as given by a user
  def response_to(input)
    prepared_input = preprocess(input.downcase)
    sentence = best_sentence(prepared_input)
    reversed_sentence = WordPlay.switch_pronouns(sentence)
    responses = possible_responses(sentence)
    responses[rand(responses.length)]
  end

  private

  # Chooses a random response phrase from the :responses hash
  # and substitutes metadata into the phrase
  def random_response(key)
    random_index = rand(@data[:responses][key].length)
    @data[:responses][key][random_index].gsub(/\[name\]/, @name)
  end

  # Performs preprocessing tasks upon all input to the bot
  def preprocess(input)
    perform_substitutions(input)
  end

  # Substitutes words and phrases on supplied input as dictated by
  # the bot's :presubs data
  def perform_substitutions(input)
    @data[:presubs].each { |s| input.gsub!(s[0], s[1]) }
    input
end

  # Using the single word keys from :responses, we search for the
  # sentence that uses the most of them, as it's likely to be the
  # 'best' sentence to parse
  def best_sentence(input)
    hot_words = @data[:responses].keys.select do |k|
      k.class == String && k =~ /^\w+$/
    end

    WordPlay.best_sentence(input.sentences, hot_words)
  end

  # Using a supplied sentence, go through the bot's :responses
  # data set and collect together all phrases that could be
  # used as responses
  def possible_responses(sentence)
    responses = []

  # Find all patterns to try to match against
  @data[:responses].keys.each do |pattern|
    next unless pattern.is_a?(String)

    # For each pattern, see if the supplied sentence contains
    # a match. Remove substitution symbols (*) before checking.
    # Push all responses to the responses array.
      if sentence.match('\b' + pattern.gsub(/\*/, '') + '\b')
        # If the pattern contains substitution placeholders,
        # perform the substitutions
        if pattern.include?('*')
          responses << @data[:responses][pattern].collect do |phrase|
            # First, erase everything before the placeholder
            # leaving everything after it
            matching_section = sentence.sub(/^.*#{pattern}\s+/, '')

            # Then substitute the text after the placeholder, with
            # the pronouns switched
            phrase.sub('*', WordPlay.switch_pronouns(matching_section))
          end
        else
          # No placeholders? Just add the phrases to the array
          responses << @data[:responses][pattern]
        end
      end
    end

    # If there were no matches, add the default ones
    responses << @data[:responses][:default] if responses.empty?

    # Flatten the blocks of responses to a flat array
    responses.flatten
  end

end

# ----

require_relative 'bot'

bot = Bot.new(:name => ARGV[0], :data_file => ARGV[1])

puts bot.greeting

while input = $stdin.gets and input.chomp != 'end'
  puts '>> ' + bot.response_to(input)
end

puts bot.farewell

# ----

require_relative 'bot'

bot = Bot.new(:name => ARGV[0], :data_file => ARGV[1])
user_lines = File.readlines(ARGV[2], 'r')

puts "#{bot.name} says: " + bot.greeting

user_lines.each do |line|
  puts "You say: " + line
  puts "#{bot.name} says:" + bot.response_to(line)
end

# ----

require 'webrick'
require_relative 'bot'

# Class that responds to HTTP/Web requests and interacts with the bot
class BotServlet < WEBrick::HTTPServlet::AbstractServlet

  # A basic HTML template consisting of a basic page with a form
  # and text entry box for the user to converse with our bot. It uses
  # some placeholder text (%RESPONSE%) so the bot's responses can be
  # substituted in easily later.
  @@html = %q{
  <html><body>
    <form method="get">
      <h1>Talk To A Bot</h1>
      %RESPONSE%
      <p>
        <b>You say:</b> <input type="text" name="line" size="40" />
        <input type="submit" />
      </p>
    </form>
  </body></html>
  }

  def do_GET(request, response)
    # Mark the request as successful and set MIME type to support HTML
    response.status = 200
    response.content_type = "text/html"

    # If the user supplies some text, respond to it
    if request.query['line'] && request.query['line'].length > 1
      bot_text = $bot.response_to(request.query['line'].chomp)
    else
      bot_text = $bot.greeting
    end

    # Format the text and substitute into the HTML template
    bot_text = %Q{<p><b>I say:</b> #{bot_text}</p>}
    response.body = @@html.sub(/\%RESPONSE\%/, bot_text)
  end
end

# Create an HTTP server on port 1234 of the local machine
# accessible via http://localhost:1234/ or http://127.0.0.1:1234/
server = WEBrick::HTTPServer.new( :Port => 1234 )
$bot = Bot.new(:name => "Fred", :data_file => "fred.bot")
server.mount "/", BotServlet
trap("INT"){ server.shutdown }
server.start

# ----

#!/usr/bin/env ruby

require_relative 'bot'
require 'cgi'

# A basic HTML template creating a basic page with a forum and text
# entry box for the user to converse with our bot. It uses some
# placeholder text (%RESPONSE%) so the bot's responses can be
# substituted in easily later
html = %q{
  <html><body>
    <form method="get">
      <h1>Talk To A Bot</h1>
      %RESPONSE%
      <p>
        <b>You say:</b> <input type="text" name="line" size="40" />
        <input type="submit" />
      </p>
    </form>
  </body></html>
}

# Set up the CGI environment and make the parameters easy to access
cgi = CGI.new
params = cgi.params
line = params['line'] && params['line'].first

bot = Bot.new(:name => "Fred", :data_file => "fred.bot")

# If the user supplies some text, respond to it
if line && line.length > 1
  bot_text = bot.response_to(line.chomp)
else
  bot_text = bot.greeting
end

# Format the text and substitute into the HTML template
# as well as sending the MIME header for HTML support
bot_text = %Q{<p><b>I say:</b> #{bot_text}</p>}
puts "Content-type: text/html\n\n"
puts html.sub(/\%RESPONSE\%/, bot_text)

# ----

require_relative 'bot'

fred = Bot.new(:name => 'Fred', :data_file => 'fred.bot')
chris = Bot.new(:name => 'Chris', :data_file => 'fred.bot')

r = fred.greeting
10.times do
  puts "#{fred.name} said: " + r
  r = chris.response_to(r)
  puts "#{chris.name} said: " + r
  r = fred.response_to(r)
end

# ----

