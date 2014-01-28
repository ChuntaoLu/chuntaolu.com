require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email1",
        :password => "foobar",
        :password_confirmation => "foobar",
        :created_at => 1.day.ago,
        :updated_at => 1.day.ago
      ),
      stub_model(User,
        :email => "Email2",
        :password => "baz",
        :password_confirmation => "baz",
        :created_at => 1.day.ago,
        :updated_at => 1.day.ago
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email1".to_s, :count => 1
    assert_select "tr>td", :text => "Email2".to_s, :count => 1
  end
end
