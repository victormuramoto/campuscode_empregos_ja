require 'rails_helper'

feature 'visitor can see job details' do
  scenario 'success' do
  job = create_job(company:create_company,category:create_category)
  visit root_path

  visit job_path(job)

  expect(page).to have_content job.title
  expect(page).to have_content job.location
  expect(page).to have_content job.company.name
  expect(page).to have_content job.category.name
  expect(page).to have_content job.description

  end

end
