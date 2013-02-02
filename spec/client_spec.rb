require_relative 'spec_helper'
require_relative '../client'

describe Client do
  let(:client) {Client.new('Bob')}

  describe ".new" do
    it "creates a Client object" do
      expect(client).to_not eq nil
    end
  end

  describe "#name" do
    it "has a name" do
      expect(client.name).to eq 'Bob'
    end
  end

end