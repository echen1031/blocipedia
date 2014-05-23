require 'spec_helper'

feature 'User visits blocipedia' do

  scenario 'log in and out successfuly' do
    user = FactoryGirl.create(:user) 
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')

    #Capybara.default_selector = :css
    find('span.glyphicon-log-out').find(:xpath,".//..").click

    expect(page).to have_content('Signed out successfully')
  end
end
