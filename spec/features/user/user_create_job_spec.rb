require 'rails_helper'

feature 'user create a job' do
  scenario 'success' do
    user = login_user
    job = new_job(company:create_company,category:create_category)

    visit new_job_path

    fill_in 'job[title]',           with: job.title
    select  job.company.name,       from:'job[company_id]'
    select  job.category.name,      from: 'job[category_id]'
    fill_in 'job[location]',        with: job.location
    fill_in 'job[description]',     with: job.description

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.company.name
    expect(page).to have_content job.category.name
    expect(page).to have_content job.description

  end

  scenario 'failed - no login' do

    visit new_job_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'


  end




  scenario 'user can feature a job' do
    job = new_job(title:'Dev c#',company:create_company,category:create_category)
    visit new_job_path

    fill_in 'job[title]',           with: job.title
    select  job.company.name,       from:'job[company_id]'
    select  job.category.name,      from: 'job[category_id]'
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

  end

  scenario "fields can't be blank" do
    visit new_job_path
    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"

  end

end
