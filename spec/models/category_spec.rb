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

require 'spec_helper'

describe Category do
  before {@category = Category.new(title: "hello", description: "hup hup")}
  
  subject {@category}
  
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  
  it { should be_valid }
  
  describe "when title is not present" do
    before { @category.title = " " }
    it { should_not be_valid }
  end
  
end
