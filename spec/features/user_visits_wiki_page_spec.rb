require 'spec_helper'

feature 'Creating a wiki' do

  scenario 'successfully creating a wiki' do
    user = FactoryGirl.create(:user) 
    login_as(user, :scope => :user)
    visit wikis_path
    click_link 'New wiki'
    fill_in 'Name', with: 'Baseball'
    fill_in 'Description', with: 'Pitchers'
    click_button 'Save'
    expect(page).to have_content('Wiki saved successfully')
    expect(current_path).to eq(wikis_path)
    expect(page).to have_content('Baseball')
  end

  scenario 'unsuccessfully creating a wiki' do
    user = FactoryGirl.create(:user) 
    login_as(user, :scope => :user)
    visit wikis_path
    click_link 'New wiki'
    fill_in 'Description', with: 'Pitchers'
    click_button 'Save'
    expect(page).to have_content('Wiki needs a name')
  end
end

feature 'Editing a wiki' do

  scenario 'successfully editing a wiki' do
    user = FactoryGirl.create(:user) 
    login_as(user, :scope => :user)
    wiki = FactoryGirl.create(:wiki, user: user)
    visit wiki_path(wiki)
    click_link 'Edit Wiki'
    fill_in 'Name', with: 'Basketball'
    fill_in 'Description', with: 'Point Guard'
    click_button 'Save'
    expect(page).to have_content('Wiki saved successfully')
    expect(current_path).to eq(wikis_path)
    expect(page).to have_content('Basketball')
  end
  
  scenario 'unsuccessfully editing a wiki' do
    user = FactoryGirl.create(:user) 
    login_as(user, :scope => :user)
    wiki = FactoryGirl.create(:wiki, user: user)
    visit wiki_path(wiki)
    click_link 'Edit Wiki'
    fill_in 'Name', with: ''
    fill_in 'Description', with: 'Point Guard'
    click_button 'Save'
    expect(page).to have_content('Error saving wiki. Please try again')
    expect(current_path).to eq(wiki_path(wiki))
  end
end

feature 'Deleting a wiki' do

  scenario 'successfully deleting a wiki' do
    user = FactoryGirl.create(:user) 
    login_as(user, :scope => :user)
    wiki = FactoryGirl.create(:wiki, user: user)
    visit wiki_path(wiki)
    click_link 'Delete'
    expect(page).to have_content('Wiki deleted successfully')
    expect(current_path).to eq(wikis_path)
  end
end 

