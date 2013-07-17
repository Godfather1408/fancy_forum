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

class Post < ActiveRecord::Base
  attr_accessible :content, :topic_id, :user_id
  
  belongs_to :topic
  belongs_to :user
  
  validates_presence_of :content, :user_id
  
  after_create :send_favorite_email
  
  private
  def send_favorite_email
    favorites = Favorite.where(topic_id: topic_id)
    favorites.each do |f|
      user = User.find(f.user_id)
      topic = Topic.find(topic_id)
      UserMailer.favorite_email(user, topic).deliver
    end
  end
end
