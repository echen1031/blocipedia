require 'spec_helper'

describe CollaboratorsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "adding user as collaborator to wiki" do
    it "adds collaborator successfully" do
      user = FactoryGirl.create(:user)
      sign_in user
      wiki = FactoryGirl.create(:wiki, user: user)
      collaborator = FactoryGirl.create(:user)
      post :create, wiki_id: wiki.id, user_id: collaborator.id
      wiki.reload

      wiki.collaborators.should eq(1)
    end
  end

end
