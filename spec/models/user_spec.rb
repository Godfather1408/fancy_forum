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

require 'spec_helper'

describe User do
  before {
    @user = User.new(email: "dh@test.de", firstname: "Hans", lastname: "Mustermann", username: "godfather", password: "moep", :password_confirmation: "moep")
  }
    
    subject { @user }
    it { should respond_to(:email) }
    it { should respond_to(:firstname) }
    it { should respond_to(:lastname) }
    it { should respond_to(:username) }
    
    it { should be_valid }
    
    describe "email is missing" do
      before { @user.email = " " }
      it { should_not be_valid }
    end
    
    describe "username is missing" do
      before { @user.category_id = " " }
      it { should_not be_valid }
    end
end
