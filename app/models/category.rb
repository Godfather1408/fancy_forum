# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :description, :title
  
  has_many :topics
end
