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

  scenario 'visitor can see recent job details'do

    job_1 = create_job(company: create_company, category: create_category)


    visit job_path(job_1)

    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.company.name
    expect(page).to have_content job_1.category.name
    expect(page).to have_content job_1.description
    expect(page).to have_content 'Novidade'


  end

  scenario 'visitor can see a recent job and featured details'do

    job_1 = create_job(company: create_company, category: create_category, featured:true)


    visit job_path(job_1)

    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.company.name
    expect(page).to have_content job_1.category.name
    expect(page).to have_content job_1.description
    expect(page).to have_content 'Novidade'
    expect(page).to have_content 'Vaga em Destaque'



  end

  scenario 'visitor can see not recent job'do

    job_1 = nil
    travel_to 6.days.ago do
      job_1 = create_job(title:'Full Stack Python', company:create_company, category: create_category)
    end

    visit job_path(job_1)

    expect(page).to have_content job_1.company.name
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.category.name
    expect(page).to have_content job_1.description

  end

  scenario 'visitor can see not recent job, but is featured'do

    job_1 = nil
    travel_to 6.days.ago do
      job_1 = create_job(title:'Full Stack Python', company:create_company, category: create_category,featured:true)
    end

    visit job_path(job_1)

    expect(page).to have_content job_1.company.name
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.category.name
    expect(page).to have_content job_1.description
    expect(page).to have_content 'Vaga em Destaque'

  end

  scenario 'visitor can see a expired job'do

    job_1 = nil
    travel_to 91.days.ago do
      job_1 = create_job(title:'Full Stack Python', company:create_company, category: create_category)
    end

    visit job_path(job_1)

    expect(page).to have_content job_1.company.name
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.category.name
    expect(page).to have_content job_1.description
    expect(page).to have_content 'Vaga Expirada'

  end

  scenario 'visitor can see a expired and featured job'do

    job_1 = nil
    travel_to 91.days.ago do
      job_1 = create_job(title:'Full Stack Python', company:create_company, category: create_category,featured:true)
    end

    visit job_path(job_1)

    expect(page).to have_content job_1.company.name
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.category.name
    expect(page).to have_content job_1.description
    expect(page).to have_content 'Vaga Expirada'
    expect(page).to have_content 'Vaga em Destaque'

  end


end
