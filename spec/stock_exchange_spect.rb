require_relative 'spec_helper'
require_relative '../stock_exchange'

describe StockExchange do
  let(:stock_exchange) {StockExchange.new('GASE')}

  describe ".new" do
    it "creates a StockExchange object" do
      expect(stock_exchange).to_not eq nil
    end
    if "has no clients" do
      expect(stock_exchange.clients.count).to eq 0
  end

  describe "#name" do
    it "has a name" do
      expect(stock_exchange.name).to eq 'GASE'
    end
  end

  describe "#add_client" do
    it "adds a client" do
      stock_exchange.add_client('Bob')
      expect(stock_exchange.clients.keys).to eq ['Bob']
    end
  end

end