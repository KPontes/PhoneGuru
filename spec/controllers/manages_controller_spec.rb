require "rails_helper"

RSpec.describe ManagesController, :type => :controller do
  describe "GET newsubordinate" do
    it "new subordinate" do
      manage = Manage.new(:manager_id => 1, :subordinate_id => nil)
      get :newsubordinate, params: {id: manage.manager_id}
      expect(response).to be_redirect
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end