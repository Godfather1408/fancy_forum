class Topic < ActiveRecord::Base
  attr_accessible :category_id, :description, :title
  
  belongs_to :category
end
