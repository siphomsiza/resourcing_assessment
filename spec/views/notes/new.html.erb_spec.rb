require 'spec_helper'

RSpec.describe "notes/new", :type => :view do
  before(:each) do
    assign(:note, create(:note))
    controller.action_name = 'new'
  end

  it "renders new note form" do
    render
    assert_select "form", :action => notes_path, :method => "post" do
      assert_select "input#note_title", :title => "note[title]"
    end
  end
end
