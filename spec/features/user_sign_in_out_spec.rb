require 'spec_helper'

feature 'User visits blocipedia' do

  let(:user) { create :user }
  
  scenario 'log in and out successfulyy' do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')

    #Capybara.default_selector = :css
    find('span.glyphicon-log-out').find(:xpath,".//..").click

    expect(page).to have_content('Signed out successfully')
  end
end
