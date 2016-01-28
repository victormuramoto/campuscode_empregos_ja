require 'rails_helper'

feature 'User creates a new job' do
  scenario 'successfully' do
   user = login_user

    company = create_company(user: user)
    company_2 = create_company(name: 'Locaweb')

    job = create_job(company)

    visit new_job_path

    fill_in 'job[title]',       with: job.title
    fill_in 'job[location]',    with: job.location
    select job.category.name,  from: 'job[category_id]'
    select company.name,   from: 'job[company_id]'
    select job.contract.name,  from: 'job[contract_id]'
    fill_in 'job[description]', with: job.description

    expect(page).to_not have_content company_2.name

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content job.contract.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
  end

  scenario 'featured job' do
    user = login_user

    company = create_company(user: user)
    job = create_job(company)

    visit new_job_path
    fill_in 'job[title]',       with: job.title
    fill_in 'job[location]',    with: job.location
    select job.category.name,   from: 'job[category_id]'
    select company.name,        from: 'job[company_id]'
    fill_in 'job[description]', with: job.description
    check   'job[featured]'

    click_on 'submit'

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

    click_on 'submit'

    ['Title', 'Category', 'Description', 'Location'].each do |field|
      expect(page).to have_content "#{field} can\'t be blank"
    end
  end
end
