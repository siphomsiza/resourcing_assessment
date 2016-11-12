require 'spec_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response.status).to eq(200)
      expect(response.success?).to eq(true)
    end
  end

end
