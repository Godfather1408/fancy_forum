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
  
  validates_presence_of :content, :user_id, :topic_id
end
