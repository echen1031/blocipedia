require 'spec_helper'

feature 'User creates wiki with markdown' do

  scenario 'Markdown is rendered successfully' do
    user = FactoryGirl.create(:user) 
    login_as(user, :scope => :user)
    visit wikis_path
    click_link 'New wiki'
    fill_in 'Name', with: 'Baseball'
    fill_in 'Description', with: "##Markdown"  # should be rendered as <h2>
    click_button 'Save'
    # should be back at list of wikis
    click_link "Baseball"  # assuming you can click on name of wiki to see it
    expect(page.html).to include('<h2>Markdown</h2>')
  end

end
