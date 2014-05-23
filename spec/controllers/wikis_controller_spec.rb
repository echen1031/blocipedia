require 'spec_helper'

describe WikisController do

  describe 'Member access' do
    describe "GET 'index'" do
      it "returns http success" do
          user = FactoryGirl.create(:admin)
          sign_in user
        get 'index'
        response.should be_success
      end
    end
  end
end
