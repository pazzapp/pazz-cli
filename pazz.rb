#! /usr/bin/ruby
require 'io/console'
require './pazzlib.rb'

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
