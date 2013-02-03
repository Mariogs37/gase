require 'rainbow'
require 'pry'
require_relative 'stock_exchange'
require_relative 'account'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'account'
require_relative 'stock_exchange'
require_relative 'data'

def menu
  puts `clear`
  puts "*** General Assembly Stock Exchange ***\n\n".color(:blue)
  puts '1 : List Stock Exchange Clients'
  puts '2 : Add a Client Account'
  puts '3 : Add Portfolio'
  puts '4 : Buy Stock'
  puts '5 : Sell Stock'
  puts '6 : Display Account Balance'
  puts '7 : Display Account Value'
  puts '8 : Display Portfolio Value'
  puts '9 : Get Live Stock Quote'
  puts "Q : Quit\n\n"
  gets.chomp.downcase
end

def list_clients
  puts $gase.accounts.keys
  gets
end

def create_account
  print 'Name: '
  name = gets.chomp
  print 'Deposit: '
  deposit = gets.to_i #need to find a way to ignore commas
  $gase.accounts[name] = Account.new(name, deposit)
end

def create_portfolio
  print 'Name: '
  name = gets.chomp
  print 'New Portfolio Name: '
  portfolio_name = gets.chomp
  $gase.accounts[name].portfolios[portfolio_name] = Portfolio.new(portfolio_name)
end

def buy_stock
  print 'Client name: '
  name = gets.chomp
  print 'Buy stock for which portfolio? '
  print $gase.accounts[name].portfolios.keys.join(', ') + ' '
  portfolio_name = gets.chomp
  print 'Stock ticker symbol: '
  stock_symbol = gets.chomp.upcase
  puts "You have #{$gase.accounts[name].portfolios[portfolio_name].stocks[stock_symbol].count} shares of #{stock_name}"
  #stock_price = get stock quote
  puts "#{stock_name} is currently trading at #{stock_price}"
  print "Number of shares to buy: "
  num_to_buy = gets.chomp
  while (num_to_buy) > ($stock_exchange.clients[name].accounts[acount_name].balance / stock_price) || (num_to_buy <= 0) || (num_to_buy.class != "Integer")
    puts "Please enter a valid number of shares to buy!"
    num_to_buy = gets.chomp
  end
  puts "Your new balance is #{$stock_exchange.clients[name].accounts[acount_name].balance -= (num_to_buy * stock_price)}!"
  puts "You now have #{$stock_exchange.clients[name].accounts[acount_name].portfolios[portfolio_name].num_of_stocks[stock_name] += num_to_buy} shares of #{stock_name}!"

  #get stock quote
  #create new stock object and add to relevant portfolio (needed?)
end

def sell_stock
  print 'Name: '
  name = gets.chomp
  print 'Sell stock from which account? '
  account_name = gets.chomp
  print 'Sell stock from which portfolio? '
  portfolio_name = gets.chomp
  puts "Here are the stocks in #{portfolio_name} porfolio: #{$stock_exchange.clients[name].accounts[acount_name].portfolios[portfolio_name].keys.join(", ")}"
  print 'Which stock would you like to sell? '
  stock_name = gets.chomp
  puts "You have #{$stock_exchange.clients[name].accounts[acount_name].portfolios[portfolio_name].num_of_stocks[stock_name]} shares of #{stock_name}"
  #stock_price = get stock quote
  puts "#{stock_name} is currently trading at #{stock_price}"
  print "How many would you like to sell? "
  num_to_sell = gets.chomp
  while (num_to_sell > $stock_exchange.clients[name].accounts[acount_name].portfolios[portfolio_name].num_of_stocks[stock_name]) || (num_to_sell <= 0) || (num_to_sell.class != "Integer")
    puts "Please enter a valid number of shares to sell!"
    num_to_sell = gets.chomp
  end
  #price = get stock quote
  puts "Your new balance is #{$stock_exchange.clients[name].accounts[acount_name].balance += (num_to_sell * price)}!"
  puts "You have #{$stock_exchange.clients[name].accounts[acount_name].portfolios[portfolio_name].num_of_stocks[stock_name] -= num_to_sell} shares of #{stock_name} remaining!"
  #get stock quote
  #if num_of_stocks == 0, delete stock object from portfolio (needed?)
end

def display_balance
  print 'Name: '
  name = gets.chomp
  print 'Account Name: '
  account_name = gets.chomp
  $stock_exchange.clients[name].accounts[account_name].balance
end

def get_quote
  print 'Stock Ticker: '
  stock_name = gets.chomp
  #yahoo finance bit here
end

def portfolio_value
  value = 0
  print 'Name: '
  name = gets.chomp
  print 'Account: '
  account_name = gets.chomp
  print 'Portfolio Name: '
  portfolio_name = gets.chomp
  $stock_exchange.clients[name].accounts[account_name].portfolios[portfolio_name].num_of_stocks.keys.each do |stock_name|
    # stock_price = get stock quote for "stock_name"
    value += stock_price * ($stock_exchange.clients[name].accounts[account_name].portfolios[portfolio_name].num_of_stocks[stock_name].to_i)
  end
  value
end

def account_value
  value = 0
  print 'Name: '
  name = gets.chomp
  print 'Account: '
  account_name = gets.chomp
  $stock_exchange.clients[name].accounts[account_name].each do |portfolio|
    $stock_exchange.clients[name].accounts[account_name].portfolios[portfolio].each do |stock|
      #stock_price = get stock quote for "stock_name"
      value += stock_price * ($stock_exchange.clients[name].accounts[account_name].portfolios[portfolio].num_of_stocks[stock].to_i)
    end
  end
  account_value
end
binding.pry
