require 'rails_helper'

feature 'user create a job' do
  scenario 'successfully' do
    job = new_job

    visit new_job_path

    fill_in 'Título', with: job.title
    fill_in 'Empresa', with: job.company
    fill_in 'Categoria', with: job.category
    fill_in 'Localização', with: job.location
    fill_in 'Descrição', with: job.description

    click_on 'Criar Vaga'
  end

  scenario 'user can feature a job' do
    job = new_job

    visit new_job_path

    fill_in 'Título', with: job.title
    fill_in 'Empresa', with: job.company
    fill_in 'Categoria', with: job.category
    fill_in 'Localização', with: job.location
    fill_in 'Descrição', with: job.description
    check   'Destaque'

    click_on 'Criar Vaga'

  end
end
