require 'spec_helper'
require 'shared/rest_api_controller'

RSpec.describe NotesController do
  context "CRUD actions" do
    def setup
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)
    end

    before(:each) do
      user = create(:user)
      # sign_in FactoryGirl.create(:user)
      #
      sign_in(user)
      @params = {:format => :json}
      @subject = create(:note)
      @built_subject = build(:note)
      @invalid_subject = build(:invalid_note)
      @index = Note.all

      @attributes = @subject.attributes
      @attributes["title"] = nil
    end
    it_behaves_like "REST API controller"
  end
end
