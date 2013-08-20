# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  important   :boolean
#

require 'spec_helper'

describe Topic do
  before { 
    @category = Category.create(title: "hello", description: "hup hup")
    @user = User.create!(email: "dh@test.de", first_name: "Hans", last_name: "Mustermann", username: "godfather", password: "moepmoep", password_confirmation: "moepmoep")
    @post = Post.create!(content: "blubbbbb", user_id: @user.id)
    @topic = Topic.new(title: "Tiel yeah!!", description: "Einfach so", category_id: @category.id)
    @topic.posts << @post
    @topic.save!
  }

    subject { @topic }
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:important) }
    it { should respond_to(:category_id) }

    it { should be_valid }

    describe "title is missing" do
      before { @topic.title = " " }
      it { should_not be_valid }
    end

    describe "category_id is missing" do
      before { @topic.category_id = " " }
      it { should_not be_valid }
    end

end
