require 'spec_helper'

feature 'Non-user visits wiki site' do
  scenario 'can see public wikis' do
    visit root_path
    click_link 'Public Wikis'
    expect(page).to have_content('All Public Wikis')
  end
end
