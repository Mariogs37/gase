class Client
  attr_accessor :name, :accounts
  def initialize(name)
    @name = name
    @accounts = {}
  end
end