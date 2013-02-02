require_relative 'spec_helper'
require_relative '../acount'

describe Stock do
  let(:account) {Account.new('Bob')}

  describe ".new" do
    it "creates a Account object" do
      expect(account).to_not eq nil
    end
  end

  describe "#owner" do
    it "has an owner" do
      expect(account.owner).to eq 'Bob'
    end
  end

end