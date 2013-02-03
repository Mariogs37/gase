require_relative 'spec_helper'
require_relative '../acount'

describe Account do
  let(:account) {Account.new('Bob')}

  describe ".new" do
    it "creates a Account object" do
      expect(account).to_not eq nil
    end
    it "has no portfolios" do
      expect(account.portfolios.count).to eq 0
    end
  end

  describe "#owner" do
    it "has an owner" do
      expect(account.owner).to eq 'Bob'
    end
  end

  describe "#create_portfolio" do
    it "creates a portfolio" do
      account.create_portfolio('Tech', 'AAPL')
      expect(account.portfolio['Tech']).to eq 'AAPL'
    end
  end

  describe "#view_balance" do
    it "displays the balance in a client's account" do
      account.balance('Bob')
      expect(account.balance('Bob')).to eq 250_000
    end
  end

  describe "#buy_stock" do
    it "adds stock to client's account" do
    end
    it "subtracts stock price from client's account balance" do
    end
  end

  describe "#sell_stock" do
    it "deletes stock from client's account" do
    end
    it "adds stock price to client's account balance" do
    end
  end


end