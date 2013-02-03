class Portfolio
  attr_accessor :name, :stocks
  def initialize(name)
    @name = name
    @stocks = {} #key = name of stock, value = number of shares in portfolio
  end
end