require "rails_helper"

RSpec.describe NumbersController, :type => :controller do
  describe "GET index" do
    it "assigns @numbers" do
      n = Number.create!(:number => "5522123456789", :countrycode => "55", :cn => "22", :prefix => "12345", :mcdu => "5789")
      get :index
      expect(assigns(:numbers)).to eq([n])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end