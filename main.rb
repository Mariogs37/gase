require 'rainbow'
require 'pry'
require_relative 'functions'
binding.pry

response = menu

while response != 'q'
  case response
  when '1' then list_clients
  when '2' then create_account
  when '3' then create_portfolio
  when '4' then buy_stock
  when '5' then sell_stock
  when '6' then puts display_balance
  when '7' then puts portfolio_value
  when '8' then puts account_value
  when '9' then puts get_quote
  end
  response = menu
end

puts "You have quit the program".color(:red)