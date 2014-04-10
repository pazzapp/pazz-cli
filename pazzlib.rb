#! /usr/bin/ruby
require 'digest/sha1'

class Pazz

  ALPHA_NUMERIC       = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  AMBIGUOUS_TOKENS    = %w( 1 l I O o 0 )
  SPECIAL_CHARACTERS  = %w( ! @ # $ % ^ & * - _ ? )
  TOKENS =  ALPHA_NUMERIC + SPECIAL_CHARACTERS - AMBIGUOUS_TOKENS
  SALT = "better_than_nothing"

  def initialize(password)
    # SHA it and store SHA2 for the seed
    @seed = Digest::SHA1.hexdigest(password + SALT)
  end

  def get_pass(site)
    Digest::SHA1.hexdigest(@seed + site + SALT)  # use SHA on seed + site
      .scan(/../)                         # pull out hex pairs
      .map(&:hex)                         # parse hex to dec
      .map{|x| TOKENS[x % TOKENS.length]}  # use to index token array
      .join                               # return as string of tokens
  end
end
