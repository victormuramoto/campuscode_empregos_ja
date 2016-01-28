require 'rails_helper'

feature 'visitor can see job details' do
  scenario 'success' do
  job = create_job(company:create_company)
  visit root_path

  visit job_path(job)

  expect(page).to have_content('Developer ruby')
  expect(page).to have_content('SP')
  expect(page).to have_content('Locaweb')
  expect(page).to have_content('Developer')
  expect(page).to have_content('teste')


  end
end
