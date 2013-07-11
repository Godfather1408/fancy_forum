class Message < ActiveRecord::Base
  attr_accessible :user_id, :content, :read, :sender_id, :subject
  
  validates_presence_of :user_id, :content, :sender_id, :subject
  
  belongs_to :user
  
  scope :not_read, where(:read => false)
end