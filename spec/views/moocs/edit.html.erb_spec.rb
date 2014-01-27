require 'spec_helper'

describe "moocs/edit" do
  before(:each) do
    @mooc = assign(:mooc, stub_model(Mooc,
      :name => "MyString",
      :platform => "MyString",
      :provider => "MyString",
      :course_link => "MyString",
      :statement_link => "MyString"
    ))
  end

  it "renders the edit mooc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => moocs_path(@mooc), :method => "post" do
      assert_select "input#mooc_name", :name => "mooc[name]"
      assert_select "input#mooc_platform", :name => "mooc[platform]"
      assert_select "input#mooc_provider", :name => "mooc[provider]"
      assert_select "input#mooc_course_link", :name => "mooc[course_link]"
      assert_select "input#mooc_statement_link", :name => "mooc[statement_link]"
    end
  end
end
