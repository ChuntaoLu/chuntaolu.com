require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, Kaminari.paginate_array([
      stub_model(Article,
        :title => "Title",
        :body => "MyText",
        :created_at => 1.day.ago
      ),
      stub_model(Article,
        :title => "Title",
        :body => "MyText",
        :created_at => 1.week.ago
      )
    ]).page(1))
  end

  it "renders a list of articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h1", :text => "Title".to_s, :count => 2
    assert_select "p", :text => "MyText".to_s, :count => 2
  end
end
