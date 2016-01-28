require 'rails_helper'

feature 'Visitor visits Emprego Ja home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Emprego Já')
  end

  scenario 'and see jobs' do
    company = create_company

    job = create_job(company, {title: 'Vaga de Dev', description: 'Dev Junior Rails com ao menos um projeto',})
    job2 = create_job(company, {title: 'Vaga de QA', description: 'QA Junior com ao menos um projeto'})

    visit root_path

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.company.name)
    expect(page).to have_content(job.category.name)
    expect(page).to have_content(job.location)
    expect(page).to have_content(job2.title)
  end
end
