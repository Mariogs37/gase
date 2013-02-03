class Account
  attr_accessor :owner, :portfolios, :balance
  def initialize(owner, balance)
    @owner = owner
    @portfolios = {}
    @balance = balance
  end
end