require 'spec_helper'

describe "microposts/edit" do
  before(:each) do
    @micropost = assign(:micropost, stub_model(Micropost,
      :content => "MyText"
    ))
  end

  it "renders the edit micropost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => microposts_path(@micropost), :method => "post" do
      assert_select "textarea#micropost_content", :name => "micropost[content]"
    end
  end
end
