# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Post do
  before { 
    @category = Category.new(title: "hello", description: "hup hup")
    @topic = Topic.new(title: "Tiel yeah!!", description: "Einfach so", category_id: @category.id, important: true)
    @user = User.new(email: "dh@test.de", last_name: "lname", first_name: "fname", username: "uname")
    @post = Post.new(content: "blubbbbb", user_id: @user.id, topic_id: @topic.id)
  }
  
  subject { @post }
  it { should respond_to(:content) }
  it { should respond_to(:topic_id) }
  it { should respond_to(:user_id) }
  
  describe "content is missing" do
    before { @post.content = " " }
    it { should_not be_valid }
  end
  
  describe "user_id is missing" do
    before { @post.user_id = " " }
    it { should_not be_valid }
  end
  
  describe "topic_id is missing" do
    before { @post.topic_id = " " }
    it { should_not be_valid }
  end
end
