require 'spec_helper'

feature 'User can sign up for blocipedia account' do
  scenario 'successfully' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Name', with: 'Eric Chen'
    fill_in 'Email', with: 'eric87chen@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password confirmation', with: 'helloworld'
    click_button 'Sign up'
    expect(page).to have_content('You have signed up successfully')
  end
end
