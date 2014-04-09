#! /usr/bin/ruby
require 'digest/sha2'
require 'digest/sha1'
require 'io/console'

ALPHA_NUMERIC       = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
AMBIGUOUS_TOKENS    = %w( 1 l I O o 0 )
SPECIAL_CHARACTERS  = %w( ! @ # $ % ^ & * - _ ? )
TOKENS =  ALPHA_NUMERIC + SPECIAL_CHARACTERS - AMBIGUOUS_TOKENS

class Pazz

  def initialize(password)
    # SHA it and store SHA2 for the seed
    @seed = Digest::SHA2.hexdigest(password)
  end

  def get_pass(site)
    Digest::SHA1.hexdigest(@seed + site)  # use SHA on seed + site
      .scan(/../)                         # pull out hex pairs
      .map(&:hex)                         # parse hex to dec
      .map{|x| TOKENS[x % TOKENS.length]}  # use to index token array
      .join                               # return as string of tokens
  end
end

# prompt for the master password
print "Enter your master password: "
password = STDIN.noecho(&:gets).strip
puts
p = Pazz.new password
site = ""

def get_site
  print "Enter a site (blank when finished): "
  gets.strip
end

while (site = get_site) != ""
  puts p.get_pass(site)
end

system "clear" or system "cls"