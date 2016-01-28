require 'rails_helper'

feature 'visitor visits the home page' do
  scenario 'success' do
    visit root_path
    expect(page).to have_content('Emprego Já')
  end

  scenario 'visitor can see jobs in home page'do
    job_1 = create_job(company: create_company, category: create_category)
    job_2 = create_job(title:'Full Stack Python', company:create_company, category: create_category)
    visit root_path

    expect(page).to have_content('Developer ruby')
    expect(page).to have_content('SP')
    expect(page).to have_content(job_1.company.name)
    expect(page).to have_content(job_2.company.name)
    expect(page).to have_content('Python')

  end
end
