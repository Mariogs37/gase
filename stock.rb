require 'pry'
require 'yahoofinance'

class Stock

  attr_accessor :name

  def initialize(name)
    @name = name
    @price = 0
  end

  def retrieve_price
    YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
  end

end