require 'rails_helper'

feature 'user create a job' do
  scenario 'success' do

    job = new_job(company:create_company,category:create_category)

    visit new_job_path

    fill_in 'Título',           with: job.title
    select  job.company.name,   from:'Empresa'
    select  job.category.name,  from: 'Categoria'
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
    job = new_job(title:'Dev c#',company:create_company,category:create_category)
    visit new_job_path

    fill_in 'Título',           with: job.title
    select  job.company.name,   from:'Empresa'
    select  job.category.name,  from: 'Categoria'
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

  scenario "field can't be blank" do
    visit new_job_path
    click_on 'Criar Vaga'

    expect(page).to have_content "Warning: The fields can't be blank"

  end

end
