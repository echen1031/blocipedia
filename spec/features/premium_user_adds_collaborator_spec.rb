require 'spec_helper'

feature 'Premium user adds collaborator' do
  scenario 'adds collaborator successfuly' do
    user = FactoryGirl.create(:premium_user)
    user1 = FactoryGirl.create(:user)
    wiki = FactoryGirl.create(:wiki, user: user)
    login_as(user, :scope => :user)
    visit wiki_path(wiki)
    click_link 'Add Collaborator'
    fill_in 'Username', with: user1.username
    click_button 'Add User'
    expect(page).to have_content('User added successfully')
    expect(current_path).to eq(wiki_collaborations_path(wiki))
  end
end



