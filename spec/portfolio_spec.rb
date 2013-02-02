require_relative 'spec_helper'
require_relative '../portfolio'

describe Portfolio do
  let(:portfolio) {Portfolio.new('Tech')}

  describe ".new" do
    it "creates a Portfolio object" do
      expect(portfolio).to_not eq nil
    end
  end

  describe "#name" do
    it "has a name" do
      expect(portfolio.name).to eq 'Tech'
    end
  end

end