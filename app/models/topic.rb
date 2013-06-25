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
  
  has_many :posts
  
  accepts_nested_attributes_for :posts, :allow_destroy => false, :reject_if => proc {|attrs| attrs['content'].blank? }
  
  validate :must_have_one_post
  
  def must_have_one_post
      errors.add(:posts, 'must have one post') if posts_empty?
  end
  def posts_empty?
      posts.empty? or posts.all? {|post| post.marked_for_destruction? }
  end
  
  has_many :favorites
  
  private  
  def number_of_posts
    self.posts.count
  end
end
