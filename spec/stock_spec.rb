require_relative 'spec_helper'
require_relative '../stock'

describe Stock do
  let(:stock) {Stock.new('AAPL')}

  describe ".new" do
    it "creates a Stock object" do
      expect(stock).to_not eq nil
    end
  end

  describe "#name" do
    it "has a name" do
      expect(stock.name).to eq 'AAPL'
    end
  end

end