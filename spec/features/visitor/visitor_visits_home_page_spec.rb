require 'rails_helper'

feature 'visitor visits the home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Emprego Já')
  end

  scenario 'visitor can see jobs in home page'do
    create_job
    create_job_with_title('Full Stack Python')
    visit root_path

    expect(page).to have_content('Developer ruby')
    expect(page).to have_content('SP')
    expect(page).to have_content('Locaweb')
    expect(page).to have_content('Python')

  end
end
