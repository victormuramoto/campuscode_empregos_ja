require 'rails_helper'

feature 'User edit job' do
  scenario 'success' do
    login_user
    new_company = create_company(name:"Campus Code")
    new_category = create_category(name:"Analista QA")
    job = create_job(company: create_company, category: create_category)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: 'Developer Haskell'
    select new_company.name,      from: 'job[company_id]'
    select new_category.name,     from: 'job[category_id]'
    select 'PJ',                  from: 'job[contract_id]'
    fill_in 'job[location]',      with: 'RS'
    fill_in 'job[description]',   with: 'tt duas vezes'

    click_on 'submit'

    expect(page).to have_content 'Developer Haskell'
    expect(page).to have_content new_company.name
    expect(page).to have_content new_category.name
    expect(page).to have_content 'RS'
    expect(page).to have_content 'tt duas vezes'
    expect(page).to have_content 'PJ'


  end

  scenario 'Redirected to Sign in when he is not logged' do
    job = create_job(company: create_company, category: create_category)
    visit edit_job_path(job)

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

  end

  scenario 'user wants to feature a job' do
    login_user
    new_company = create_company(name:"Campus Code")
    new_category = create_category(name:"Analista QA")
    job = create_job(company: create_company, category: create_category)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: 'Developer Haskell'
    select new_company.name,      from: 'job[company_id]'
    select new_category.name,     from: 'job[category_id]'
    select 'PJ',                  from: 'job[contract_id]'
    fill_in 'job[location]',      with: 'RS'
    fill_in 'job[description]',   with: 'tt duas vezes'
    check 'job[featured]'

    click_on 'submit'

    expect(page).to have_content 'Developer Haskell'
    expect(page).to have_content new_company.name
    expect(page).to have_content new_category.name
    expect(page).to have_content 'RS'
    expect(page).to have_content 'tt duas vezes'
    expect(page).to have_content 'Vaga em Destaque'
    expect(page).to have_content 'PJ'

  end

  scenario "fields can't be blank" do
    login_user
    new_company = create_company(name:"Campus Code")
    new_category = create_category(name:"Analista QA")
    job = create_job(company: create_company, category: create_category)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: ''

    within '#job_company_id' do find("option[value='']").click end
    within '#job_company_id' do find("option[value='']").click end
    within '#job_contract_id' do find("option[value='']").click end
    fill_in 'job[location]',      with: ''
    fill_in 'job[description]',   with: ''
    check 'job[featured]'

    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"


  end


end
