require "rails_helper"

RSpec.describe Number, :type => :model do
  context "Number transactions" do
    it "Create a number" do
      n = Number.create!(:number => "5522123456789", :countrycode => "55", :cn => "22", :prefix => "12345", :mcdu => "5789")
      expect(n.reload.number).to eq("5522123456789")
    end
  end
end