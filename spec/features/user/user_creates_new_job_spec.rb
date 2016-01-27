require 'rails_helper'

feature 'User creates a new job' do
  scenario 'successfully' do
   user = login_user

    company = Company.create(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476',
                            user: user)


   company_2 = Company.create(name: 'Campus Code 2',
                           location: 'São Paulo',
                           mail: 'contato@campus.com.br',
                           phone: '2369-3476',
                           user: create_user)

    category = Category.create(name: 'Desenvolvedor')

    contract = Contract.create(name: 'CLT')

    job = create_job(company, category, contract)

    visit new_job_path

    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    select category.name,  from: 'Category'
    select company.name,   from: 'Company'
    select contract.name,  from: 'job[contract_id]'
    fill_in 'Description', with: job.description

    expect(page).to_not have_content company_2.name

    click_on 'Criar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content job.contract.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
  end

  scenario 'featured job' do
    user = login_user

    company = Company.create(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476',
                            user: user)

    category = Category.create(name: 'Desenvolvedor')

    job = create_job(company,category)

    visit new_job_path
    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    select category.name,  from: 'Category'
    select company.name,   from: 'Company'
    fill_in 'Description', with: job.description
    check   'Featured'

    click_on 'Criar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
    expect(page).to have_content 'Vaga em Destaque'
  end

  scenario 'invalid data' do
    login_user
    visit new_job_path

    click_on 'Criar Vaga'

    ['Title', 'Category', 'Description', 'Location'].each do |field|
      expect(page).to have_content "#{field} can\'t be blank"
    end
  end
end
