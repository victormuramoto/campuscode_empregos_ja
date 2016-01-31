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

    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.company.name

    expect(page).to have_content job_2.company.name
    expect(page).to have_content job_2.location
    expect(page).to have_content job_2.title

  end

  scenario 'visitor can see recent jobs'do

    job_1 = create_job(company: create_company, category: create_category)

    job_2 = nil
    travel_to 6.days.ago do
      job_2 = create_job(title:'Full Stack Python', company:create_company, category: create_category)
    end

    visit root_path

    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.company.name
    expect(page).to have_content 'Novidade'


    expect(page).to have_content job_2.company.name
    expect(page).to have_content job_2.location
    expect(page).to have_content job_2.title

  end

  scenario 'visitor can see recent and featured jobs'do

    job_1 = create_job(company: create_company, category: create_category,featured:true)

    job_2 = nil
    travel_to 6.days.ago do
      job_2 = create_job(title:'Full Stack Python', company:create_company, category: create_category)
    end

    visit root_path

    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.company.name
    expect(page).to have_content 'Novidade'
    expect(page).to have_content 'Vaga em Destaque'


    expect(page).to have_content job_2.company.name
    expect(page).to have_content job_2.location
    expect(page).to have_content job_2.title

  end

  scenario 'visitor cannot see expired jobs'do

    job_1 = create_job(company: create_company{name:'Locaweb'}, category: create_category)

    job_2 = nil
    travel_to 91.days.ago do
      job_2 = create_job(title:'Full Stack Python', company:create_company{name:'Campus Code'}, category: create_category)
    end

    visit root_path
    expect(page).to have_content job_1.title

    expect(page).to_not have_content job_2.title

  end

  scenario 'visitor see premium companies' do
    company1 = create_company(name:'Locaweb')
    company2 = create_company(name:'Campus Code')

    5.times do
      create_job(company:company1, category:create_category)
    end
    visit root_path

    expect(page).to have_content company1.name
    expect(page).to have_content 'Anunciante Premium'

    expect(page).to have_content company2.name

  end

end
