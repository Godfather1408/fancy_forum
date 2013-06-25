require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :read => false,
      :content => "MyText",
      :subject => "MyString",
      :sender_id => 1,
      :adressee_id => 1
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_read", :name => "message[read]"
      assert_select "textarea#message_content", :name => "message[content]"
      assert_select "input#message_subject", :name => "message[subject]"
      assert_select "input#message_sender_id", :name => "message[sender_id]"
      assert_select "input#message_adressee_id", :name => "message[adressee_id]"
    end
  end
end
