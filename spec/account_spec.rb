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

  describe "create_portfolio" do
    it "creates a portfolio" do
      account.create_portfolio('Tech', 'AAPL')
      expect(account.portfolio['Tech']).to eq 'AAPL'
    end
  end

end