require 'spec_helper'
RSpec.describe DashboardController, :type => :controller do

  describe "GET index" do
    before(:each) do
      user = create(:user)
      sign_in(user)
    end
    it "returns http success" do
      get :index
      expect(response.status).to eq(200)
      expect(response.success?).to eq(true)
    end
  end

end
