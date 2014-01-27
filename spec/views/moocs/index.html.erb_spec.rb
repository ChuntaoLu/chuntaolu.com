require 'spec_helper'

describe "moocs/index" do
  before(:each) do
    assign(:moocs,
      { 'Edx' => [
      stub_model(Mooc,
        :name => "Name",
        :platform => "Platform",
        :provider => "Provider",
        :course_link => "Course Link",
        :statement_link => "Statement Link",
        :finish_date => 2.months.ago
      ),
      stub_model(Mooc,
        :name => "Name",
        :platform => "Platform",
        :provider => "Provider",
        :course_link => "Course Link",
        :statement_link => "Statement Link",
        :finish_date => 10.months.ago
      )
    ]})
  end

  it "renders a list of moocs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "div", :text => /Name/, :count => 2
  end
end
