require 'spec_helper'

RSpec.describe "notes/edit", :type => :view do
  before(:each) do
    @note = assign(:note, create(:note))
  end

  it "renders the edit note form" do
    render
    assert_select "form", :action => note_path(@note), :method => "post" do
      assert_select "input#note_title", :title => "note[title]"
    end
  end
end
