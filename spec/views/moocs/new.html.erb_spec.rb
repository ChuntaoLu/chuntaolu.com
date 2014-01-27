require 'spec_helper'

describe "moocs/new" do
  before(:each) do
    assign(:mooc, stub_model(Mooc,
      :name => "MyString",
      :platform => "MyString",
      :provider => "MyString",
      :course_link => "MyString",
      :statement_link => "MyString"
    ).as_new_record)
  end

  it "renders new mooc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => moocs_path, :method => "post" do
      assert_select "input#mooc_name", :name => "mooc[name]"
      assert_select "input#mooc_platform", :name => "mooc[platform]"
      assert_select "input#mooc_provider", :name => "mooc[provider]"
      assert_select "input#mooc_course_link", :name => "mooc[course_link]"
      assert_select "input#mooc_statement_link", :name => "mooc[statement_link]"
    end
  end
end
