require 'rails_helper'

feature 'Visitor visits job details' do
  scenario 'successfully' do
    job = create_job(create_company)

    visit root_path

    click_on 'Ver mais'

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content job.company.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
    expect(page).to have_content job.contract.name

  end
end
