require 'spec_helper'

describe "categories/new" do
  before(:each) do
    assign(:category, stub_model(Category,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categories_path, :method => "post" do
      assert_select "input#category_title", :name => "category[title]"
      assert_select "textarea#category_description", :name => "category[description]"
    end
  end
end
