require 'rainbow'
require 'pry'
require 'YahooFinance'
require_relative 'stock_exchange'
require_relative 'account'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'account'
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
  puts '7 : Display Portfolio Value'
  puts '8 : Display Total Account Value'
  puts '9 : Get Live Stock Quote'
  puts "Q : Quit\n\n"
  gets.chomp.downcase
end

def list_clients
  puts $gase.accounts.keys
  puts "Press 'enter' to continue.".color(:yellow)
  gets
end

def create_account
  print 'Name: '
  name = gets.chomp.capitalize
  print 'Initial Deposit: '
  deposit = gets.to_i #need to find a way to ignore commas
  $gase.accounts[name] = Account.new(name, deposit)
  puts "Account added. Press 'enter' to continue.".color(:yellow)
  gets
end

def create_portfolio
  print 'Name: '
  name = gets.chomp.capitalize
  print 'New Portfolio Name: '
  portfolio_name = gets.chomp
  $gase.accounts[name].portfolios[portfolio_name] = Portfolio.new(portfolio_name)
  puts "Portfolio added. Press 'enter' to continue.".color(:yellow)
  gets
end

def buy_stock
  print 'Client name: '
  name = gets.chomp.capitalize
  print 'Buy stock for which portfolio? '
  print $gase.accounts[name].portfolios.keys.join(', ') + ' '
  portfolio_name = gets.chomp.capitalize
  print 'Stock ticker symbol: '
  $stock_symbol = gets.chomp.upcase
  if $gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol] != nil
    puts "You have #{$gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol].shares} shares of #{$stock_symbol}"
  else
    puts "You have 0 shares of #{$stock_symbol}"
  end
  print "#{$stock_symbol} is currently trading at "
  puts stock_quote
  puts "You have $#{$gase.accounts[name].balance} in your account."
  print "Number of shares to buy: "
  num_to_buy = gets.to_i
  $gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol] = Stock.new($stock_symbol)
  while (num_to_buy * $gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol].price) > ($gase.accounts[name].balance) || (num_to_buy <= 0)
    puts "Please enter a valid number of shares to buy!"
    num_to_buy = gets.to_i
  end
  puts "Your new balance is #{$gase.accounts[name].balance -= (num_to_buy * $gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol].price)}."
  puts "You now have #{$gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol].shares += num_to_buy} shares of #{$stock_symbol}"
  puts "Press 'enter' to continue.".color(:yellow)
  gets
end

def sell_stock
  print 'Name: '
  name = gets.chomp.capitalize
  print 'Sell stock from which portfolio? '
  print $gase.accounts[name].portfolios.keys.join(', ') + ' '
  portfolio_name = gets.chomp.capitalize
  puts "Here are the stocks in your #{portfolio_name} porfolio: #{$gase.accounts[name].portfolios[portfolio_name].stocks.keys.join(", ")}"
  print 'Which stock would you like to sell? '
  $stock_symbol = gets.chomp.upcase
  puts "You have #{$gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol].shares} shares of #{$stock_symbol}."
  print "#{$stock_symbol} is currently trading at "
  puts stock_quote
  print "How many shares would you like to sell? "
  num_to_sell = gets.to_i
  while (num_to_sell > $gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol].shares) || (num_to_sell <= 0)
    puts "Please enter a valid number of shares to sell!"
    num_to_sell = gets.to_i
  end
  puts "Your new balance is #{$gase.accounts[name].balance += (num_to_sell * $gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol].price).round}."
  puts "You have #{$gase.accounts[name].portfolios[portfolio_name].stocks[$stock_symbol].shares -= num_to_sell} shares of #{$stock_symbol} remaining."
  puts "Press 'enter' to continue.".color(:yellow)
  gets
end

def display_balance
  print 'Name: '
  name = gets.chomp.capitalize
  puts "$#{$gase.accounts[name].balance}"
  puts "Press 'enter' to continue.".color(:yellow)
  gets
end

def get_quote
  print 'Stock Ticker: '
  stock_name = gets.chomp.upcase
  puts YahooFinance::get_quotes(YahooFinance::StandardQuote, stock_name)[stock_name].lastTrade
  puts "Press 'enter' to continue.".color(:yellow)
  gets
end

def stock_quote
  begin
    YahooFinance::get_quotes(YahooFinance::StandardQuote, $stock_symbol)[$stock_symbol].lastTrade
  rescue
    puts "Unable to connect to server."
  end
end

def portfolio_value
  value = 0
  print 'Name: '
  name = gets.chomp.capitalize
  print 'Portfolio Name: '
  print $gase.accounts[name].portfolios.keys.join(', ') + ' '
  portfolio_name = gets.chomp.capitalize
  $gase.accounts[name].portfolios[portfolio_name].stocks.keys.each do |stock_name|
    value += ($gase.accounts[name].portfolios[portfolio_name].stocks[stock_name].price) * ($gase.accounts[name].portfolios[portfolio_name].stocks[stock_name].shares)
  end
  puts value
  puts "Press 'enter' to continue.".color(:yellow)
  gets
end

def account_value
  value = 0
  print 'Name: '
  name = gets.chomp.capitalize
  $gase.accounts[name].portfolios.keys.each do |portfolio_name|
    $gase.accounts[name].portfolios[portfolio_name].stocks.keys.each do |stock_name|
    value += ($gase.accounts[name].portfolios[portfolio_name].stocks[stock_name].price) * ($gase.accounts[name].portfolios[portfolio_name].stocks[stock_name].shares)
    end
    value += $gase.accounts[name].balance
  end
  puts value
  puts "Press 'enter' to continue.".color(:yellow)
  gets
end
