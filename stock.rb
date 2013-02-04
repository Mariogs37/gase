class Stock
  attr_accessor :name, :shares, :price
  def initialize(name)
    @name = name
    @shares = 0
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, name)[name].lastTrade
  end
end
