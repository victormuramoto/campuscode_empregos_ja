require 'rails_helper'

feature 'visitor visits the home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Emprego Já')
  end

  scenario 'visitor can see jobs in home page'do
    company = create_company
    job_1 = create_job(company: company)
    job_2 = create_job(title:'Full Stack Python', company:company)
    visit root_path

    expect(page).to have_content('Developer ruby')
    expect(page).to have_content('SP')
    expect(page).to have_content(job_1.company.name)
    expect(page).to have_content(job_2.company.name)
    expect(page).to have_content('Python')

  end
end
