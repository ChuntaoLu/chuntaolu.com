require 'spec_helper'

describe "microposts/index" do
  before(:each) do
    assign(:microposts, Kaminari.paginate_array([
      stub_model(Micropost,
        :content => "MyText",
        :tag_list => 'MyTag',
        :created_at => 1.day.ago
      ),
      stub_model(Micropost,
        :content => "MyText",
        :tag_list => 'MyTag',
        :created_at => 1.week.ago
      )
    ]).page(1))
  end

  it "renders a list of microposts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "p", :text => "MyText".to_s, :count => 2
  end
end
