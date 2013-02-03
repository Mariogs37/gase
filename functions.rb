require 'rainbow'
require_relative 'stock_exchange'
require_relative 'client'
require_relative 'account'
require_relative 'portfolio'
require_relative 'stock'

def menu
  puts `clear`
  puts 'General Assembly Stock Exchange Manager'.color(:blue)
  puts '(C)lient Management,'
end