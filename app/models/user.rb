# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  username               :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :avatar
  
  has_many :posts
  has_many :favorites
  
  has_attached_file :avatar, :styles => { :small => "50x50", :medium => "100x100>", :large => "150x150"},
                    :default_url => '/assets/missing_:style.png'
  
  validates_presence_of :email, :last_name, :first_name, :username
  
  searchable do
      text :username, :boost => 3
      text :first_name, :last_name
  end
  
  def favorite?(topic_id)
     if favorites.where(:topic_id => topic_id).count == 0 
      false
     else 
      true
    end
  end
  
  private  
  def number_of_posts
    self.posts.count
  end
end
