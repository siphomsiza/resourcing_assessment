require 'spec_helper'

RSpec.describe "Notes", :type => :request do
  describe "GET /notes" do
    it "works! (now write some real specs)" do
      get root_path 
      expect(response.status).to be(200)
    end
  end
end
