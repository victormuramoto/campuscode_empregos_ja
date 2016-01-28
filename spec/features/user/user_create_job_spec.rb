require 'rails_helper'

feature 'user create a job' do
  scenario 'successfully' do
    company = create_company
    job = new_job(company: company)

    visit new_job_path

    fill_in 'Título',           with: job.title
    select  job.company.name,   from:'Empresa'
    fill_in 'Categoria',        with: job.category
    fill_in 'Localização',      with: job.location
    fill_in 'Descrição',        with: job.description

    click_on 'Criar Vaga'

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.location)
    expect(page).to have_content(job.company.name)
    expect(page).to have_content(job.category)
    expect(page).to have_content(job.description)

  end

  scenario 'user can feature a job' do
    job = new_job(company:create_company)

    visit new_job_path

    fill_in 'Título',           with: job.title
    select  job.company.name,       from:'Empresa'
    fill_in 'Categoria',        with: job.category
    fill_in 'Localização',      with: job.location
    fill_in 'Descrição',        with: job.description
    check   'Destaque'

    click_on 'Criar Vaga'


    expect(page).to have_content(job.title)
    expect(page).to have_content(job.location)
    expect(page).to have_content(job.company.name)
    expect(page).to have_content(job.category)
    expect(page).to have_content(job.description)


  end

end
