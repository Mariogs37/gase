class Portfolio
  attr_accessor :name, :stocks, :num_of_stocks
  def initialize(name)
    @name = name
    @num_of_stocks = {} #key = name of stock, value = number of shares in portfolio
  end
end