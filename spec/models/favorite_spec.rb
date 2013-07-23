require 'spec_helper'

describe Favorite do
  before { 
    @category = Category.new(title: "hello", description: "hup hup")
    @topic = Topic.new(title: "Tiel yeah!!", description: "Einfach so", category_id: @category.id, important: true)
    @user = User.new(email: "dh@test.de", last_name: "lname", first_name: "fname", username: "uname")
    @favorite = Favorite.new(topic_id: @topic.id, user_id: @user.id)
  }
  
  subject { @favorite }
  it { should respond_to(:topic_id) }
  it { should respond_to(:user_id) }
  
end
