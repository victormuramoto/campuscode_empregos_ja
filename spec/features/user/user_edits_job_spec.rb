require 'rails_helper'

feature 'User creates a new job' do

  scenario 'successfully' do
    login_user

    company = Company.create(name:    'Campus Code',
                            location: 'São Paulo',
                            mail:     'contato@campuscode.com.br',
                            phone:    '2369-3476')

    new_company = Company.create(name:     'Code Campus',
                                 location: 'Refice',
                                 mail:     'contato@codecampus.com.br',
                                 phone:    '1111-5555')

    category = Category.create(name: 'Desenvolvedor')

    new_category = Category.create(name: 'Dev Ninja')

    new_contract = Category.create(name: 'PJ')

    job = create_job(company,category)

    visit edit_job_path(job)

    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    select  new_company.name
    select  new_category.name
    select  new_contract.name
    fill_in 'Description', with: job.description

    click_on 'Atualizar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content 'Dev Ninja'
    expect(page).to have_content job.contract.name
    expect(page).to have_content 'Code Campus'
    expect(page).to have_content job.description
  end

  scenario 'featured job' do
    login_user

    company = Company.create(name:     'Campus Code',
                            location: 'São Paulo',
                            mail:     'contato@campuscode.com.br',
                            phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = create_job(company,category)

    visit edit_job_path(job)

    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    select  'Campus Code'
    select  'Desenvolvedor'
    select  job.contract.name
    fill_in 'Description', with: job.description
    check   'Featured'

    click_on 'Atualizar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content job.contract.name
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content job.description
    expect(page).to have_content 'Vaga em Destaque'
  end


end
