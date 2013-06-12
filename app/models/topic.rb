class Topic < ActiveRecord::Base
  attr_accessible :category_id, :description, :title
  
  scope :important, where(:important => true)
  
  belongs_to :category
  
  has_many :posts
end
