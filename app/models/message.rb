class Message < ActiveRecord::Base
  attr_accessible :adressee_id, :content, :read, :sender_id, :subject
  
  validates_presence_of :adressee_id, :content, :read, :sender_id, :subject
end