require 'spec_helper'

RSpec.describe "notes/show", :type => :view do
  before(:each) do
    @note = assign(:note, create(:note))
  end

  it "renders attributes in <p>" do
    render
    expect(view).to render_template(:show, :count => 1)
  end
end
