require 'spec_helper'

feature 'User creates wiki' do
  let(:user) { create :user }

  scenario 'successfully' do
    visit wikis_path
    click_link 'New wiki'
    fill_in 'Name', with: 'Baseball'
    fill_in 'Description', with: 'Pitchers'
    click_button 'Save'
    expect(page).to have_content('Wiki saved successfully')
    expect(current_path).to eq(wikis_path)
    expect(page).to have_content('Baseball')
  end

  scenario "unsucessfully" do
    visit wikis_path
    click_link 'New wiki'
    fill_in 'Description', with: 'Pitchers'
    click_button 'Save'
    expect(page).to have_content('Wiki needs a name')
  end

end
