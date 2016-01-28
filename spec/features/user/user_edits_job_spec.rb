require 'rails_helper'

feature 'User edit a job' do

  scenario 'successfully' do
    user = login_user

    company = create_company(user: user, name: 'Campus Code', location: 'São Paulo')
    new_company = create_company(user: user, name: 'Locaweb', location: 'Recife')

    new_category = create_category(name: 'Dev Ninja')

    new_contract = create_contract(name: 'PJ')

    job = create_job(company)

    visit edit_job_path(job)

    fill_in 'job[title]',       with: job.title
    fill_in 'job[location]',    with: job.location
    select  new_company.name,   from: 'job[company_id]'
    select  new_category.name,  from: 'job[category_id]'
    select  new_contract.name,  from: 'job[contract_id]'
    fill_in 'job[description]', with: job.description

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content new_category.name
    expect(page).to have_content new_contract.name
    expect(page).to have_content new_company.name
    expect(page).to have_content job.description
  end

  scenario 'featured job' do
    user = login_user

    company = create_company(user: user)

    job = create_job(company)

    visit edit_job_path(job)

    fill_in 'job[title]',       with: job.title
    fill_in 'job[location]',    with: job.location
    select  job.company.name,      from: 'job[company_id]'
    select  job.category.name,    from: 'job[category_id]'
    select  job.contract.name,  from: 'job[contract_id]'
    fill_in 'job[description]', with: job.description
    check   'job[featured]'

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content job.contract.name
    expect(page).to have_content job.company.name
    expect(page).to have_content job.description
    expect(page).to have_content 'Vaga em Destaque'
  end

  scenario "User trying to edit jobs of other users" do
    user = login_user

    company = create_company
    job = create_job(company)

    visit edit_job_path(job)

    expect(page).to have_content "Warning: Your user can't edit a job that don't belong to you"
  end

end
