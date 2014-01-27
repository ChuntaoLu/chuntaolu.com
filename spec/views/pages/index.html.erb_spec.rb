require 'spec_helper'

describe "pages/index" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :name => "Name",
        :body => "MyText",
        :created_at => 1.day.ago,
        :updated_at => 1.day.ago
      ),
      stub_model(Page,
        :name => "Name",
        :body => "MyText",
        :created_at => 1.day.ago,
        :updated_at => 1.day.ago
      )
    ])
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    #assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
