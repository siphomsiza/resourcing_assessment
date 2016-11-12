require 'spec_helper'

RSpec.describe "notes/index", :type => :view do
  before(:each) do
    assign(:notes, [
      create(:note),
      create(:note)
    ])
  end

  it "renders a list of notes" do
    render
    expect(view).to render_template(:index, :count => 2)
  end
end
