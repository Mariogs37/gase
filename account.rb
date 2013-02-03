class Account
  attr_accessor :name, :portfolios, :balance
  def initialize(name)
    @name = name
    @portfolios = {}
    @balance = 0
  end
end