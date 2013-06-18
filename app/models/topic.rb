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
  attr_accessible :important, :as => [:default, :admin] #kann man das oben dabei schreiben
  
  scope :important, where(:important => true)
  
  validates_presence_of :title, :category_id
  
  belongs_to :category
  
  has_many :posts, :dependent => :destroy
  
  accepts_nested_attributes_for :posts, :reject_if => lambda { |a| a[:content].blank? }
  
  searchable do
    text :title
  end
  
  private  
  def number_of_posts
    self.posts.count
  end
end
