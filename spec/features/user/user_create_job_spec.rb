require 'rails_helper'

feature 'user create a job' do
  scenario 'success' do
    login_user
    job = new_job

    visit new_job_path

    fill_in 'job[title]',           with: job.title
    select  job.company.name,       from:'job[company_id]'
    select  job.category.name,      from: 'job[category_id]'
    select  job.contract.name,      from: 'job[contract_id]'
    fill_in 'job[location]',        with: job.location
    fill_in 'job[description]',     with: job.description

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.company.name
    expect(page).to have_content job.category.name
    expect(page).to have_content job.description
    expect(page).to have_content job.contract.name

  end

  scenario 'User can just choose their own companies to create jobs' do
    user = login_user

    company1 = create_company(name:'Locaweb',user:user)
    company2 = create_company(name:'Code Campus',user:user)

    company3 = create_company(name:'Campus Code',user:create_user(email:'otheruser@other.com',password:'98765432'))

    visit new_job_path

    expect(page).to have_content company1.name
    expect(page).to have_content company2.name

    expect(page).to_not have_content company3.name


  end

  scenario 'Redirected to Sign in when he is not logged' do

    visit new_job_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

  end


  scenario 'user can feature a job' do
    login_user
    job = new_job(title:'Dev c#')
    visit new_job_path

    fill_in 'job[title]',           with: job.title
    select  job.company.name,       from:'job[company_id]'
    select  job.category.name,      from: 'job[category_id]'
    select  job.contract.name,      from: 'job[contract_id]'

    fill_in 'job[location]',        with: job.location
    fill_in 'job[description]',     with: job.description
    check   'job[featured]'

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.company.name
    expect(page).to have_content job.category.name
    expect(page).to have_content job.description
    expect(page).to have_content 'Vaga em Destaque'
    expect(page).to have_content job.contract.name

  end

  scenario "fields can't be blank" do
    login_user
    visit new_job_path
    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"

  end

end
