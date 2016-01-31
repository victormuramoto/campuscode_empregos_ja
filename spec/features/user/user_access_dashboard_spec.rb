require 'rails_helper'

feature 'User access dashboard' do
  scenario 'success' do
    user = login_user
    company = create_company(user:user)

    job = create_job(company:company)

    visit dashboard_index_path

    expect(page).to have_content job.title
    expect(page).to have_content job.company.name
    expect(page).to have_content job.category.name
    expect(page).to have_content job.contract.name

  end

  scenario 'failed' do

    visit dashboard_index_path

    expect(page).to have_content "Warning: You must be logged to access the dashboard"
  end
end
