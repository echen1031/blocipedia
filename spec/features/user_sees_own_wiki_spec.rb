require 'spec_helper'

feature 'User sees own wikis' do

  scenario 'successfully sees own wiki' do
    user = FactoryGirl.create(:user) 
    login_as(user, :scope => :user)
    visit wikis_path
    click_link 'New wiki'
    fill_in 'Name', with: 'Baseball'
    fill_in 'Description', with: 'Pitchers'
    click_button 'Save'
    click_link 'My Wikis'
    expect(page).to have_content('Baseball')
  end
end
