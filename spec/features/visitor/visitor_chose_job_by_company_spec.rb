require 'rails_helper'

feature 'Visitor choose jobs by company' do
  scenario 'successfully' do
    company = create_company

    job = create_job(company)
    visit root_path

    click_on company.name

    expect(page).to have_content company.name
    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
  end

  scenario 'and does not see other company jobs' do
    company = create_company
    company_2 = create_company(name: 'Locaweb')

    job = create_job(company)

    visit root_path

    click_on company_2.name

    expect(page).to have_content company_2.name
    expect(page).not_to have_content job.title
    expect(page).not_to have_content job.category.name
    expect(page).not_to have_content job.description
    expect(page).not_to have_content job.location
  end

end
