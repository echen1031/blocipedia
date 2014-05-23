require 'spec_helper'

describe CollaborationsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "adding user as collaborator to wiki" do
    it "adds collaborator successfully" do
      user = FactoryGirl.create(:premium_user)
      sign_in user
      wiki = FactoryGirl.create(:wiki, user: user)
      collaborator = FactoryGirl.create(:user)
      post :create, wiki_id: wiki.id, username: collaborator.username
      wiki.reload

      wiki.collaborations.count.should eq(1)
    end
  end

end
