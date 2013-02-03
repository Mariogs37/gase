require_relative 'spec_helper'
require_relative '../client'

#is this page necessary?

describe Client do
  let(:client) {Client.new('Bob')}

  describe ".new" do
    it "creates a Client object" do
      expect(client).to_not eq nil
    end
    it "does not have an account" do
      expect(client.accounts.count).to eq 0
  end

  describe "#name" do
    it "has a name" do
      expect(client.name).to eq 'Bob'
    end
  end

  describe "#create_account" do
    it "creates an account" do
      client.create_account(250_000)
      expect(client.account).to_not eq nil
    end
  end

end