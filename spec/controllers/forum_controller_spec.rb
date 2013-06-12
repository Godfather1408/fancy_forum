require 'spec_helper'

describe ForumController do

  describe "GET 'topic'" do
    it "returns http success" do
      get 'topic'
      response.should be_success
    end
  end

end
