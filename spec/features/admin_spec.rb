require 'spec_helper'

feature 'Admin signs in blocipedia' do
  scenario 'successfully accesses the dashboard' do
    user = FactoryGirl.create(:admin)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content ('Administration')
  end
end
