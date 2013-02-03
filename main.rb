require 'pry'
require 'yahoofinance'
require_relative 'data.rb'
require_relative 'functions.rb'

response = menu

while response != 'Q'
  case response
  when '0' then create_client
  when '1' then puts list_clients
  when '2' then create_account
  when '3' then create_portfolio
  when '4' then buy_stock
  when '5' then sell_stock
  when '6' then puts display_balance
  when '7' then puts account_value
  when '8' then puts portfolio_value
  when '9' then puts get_quote
  end

  response = menu
end