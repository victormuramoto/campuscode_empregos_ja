require 'rails_helper'

feature 'Visitor view recent jobs' do
  scenario 'successfully' do
    job = create_job(create_company)

    visit root_path

    within('.jobs:first-child') do
      expect(page).to have_content('Novidade')
    end
  end
end
