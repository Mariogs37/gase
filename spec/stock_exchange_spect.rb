require_relative 'spec_helper'
require_relative '../stock_exchange'

describe StockExchange do
  let(:stock_exchange) {StockExchange.new('GASE')}

  describe ".new" do
    it "creates a StockExchange object" do
      expect(stock_exchange).to_not eq nil
    end
  end

  describe "#name" do
    it "has a name" do
      expect(stock_exchange.name).to eq 'GASE'
    end
  end

end