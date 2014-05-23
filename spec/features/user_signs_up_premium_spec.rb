require 'spec_helper'

feature 'User signs up premium account' do

  scenario 'User signs up for premium successfully' do
    user = FactoryGirl.create(:user) 
    login_as(user, :scope => :user)
    visit root_path
    click_link 'My Account'
    expect(page).to have_content('My Account')
  end
end
