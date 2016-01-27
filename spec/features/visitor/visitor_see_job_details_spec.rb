require 'rails_helper'

feature 'visitor can see job details' do
  scenario 'successfully' do
  job = create_job
  visit root_path

  visit job_path(job)

  expect(page).to have_content('Developer ruby')
  expect(page).to have_content('SP')
  expect(page).to have_content('Locaweb')
  expect(page).to have_content('Developer')
  expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')


  end
end
