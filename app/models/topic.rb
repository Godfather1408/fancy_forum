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

class Topic < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :posts_attributes
  
  scope :important, where(:important => true)
  
  belongs_to :category
  
  has_many :posts
  
  accepts_nested_attributes_for :posts, :reject_if => lambda { |a| a[:content].blank? }
  
  private  
  def number_of_posts
    self.posts.count
  end
end
