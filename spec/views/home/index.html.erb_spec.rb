require 'spec_helper'

RSpec.describe "home/index.html.erb", :type => :view do
  include Devise::TestHelpers
  include Warden::Test::Helpers

  before(:each) do
    user = create(:user)
    sign_in(user)
    @notes = assign(:notes, [
      create(:note),
      create(:note)
    ])
  end

  it "renders a list of notes" do
    render
    expect(view).to render_template(:index)
  end
end
