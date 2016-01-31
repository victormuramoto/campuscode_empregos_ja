require 'rails_helper'

feature 'User edit job' do
  scenario 'success' do
    user = login_user
    my_company = create_company(name:"Campus Code",user:user)
    new_category = create_category(name:"Analista QA")
    new_contract = create_contract(name:"PJ")
    job = create_job(company:my_company)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: 'Developer Haskell'
    select my_company.name,      from: 'job[company_id]'
    select new_category.name,     from: 'job[category_id]'
    select new_contract.name,     from: 'job[contract_id]'
    fill_in 'job[location]',      with: 'RS'
    fill_in 'job[description]',   with: 'tt duas vezes'

    click_on 'submit'

    expect(page).to have_content 'Developer Haskell'
    expect(page).to have_content my_company.name
    expect(page).to have_content new_category.name
    expect(page).to have_content new_contract.name
    expect(page).to have_content 'RS'
    expect(page).to have_content 'tt duas vezes'
    expect(page).to have_content 'PJ'


  end

  scenario 'User can edit their own jobs' do
    user = login_user

    my_company = create_company(name:"Campus Code",user:user)
    new_category = create_category(name:"Analista QA")

    new_contract = create_contract(name:"PJ")
    job = create_job(company: my_company)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: 'Developer Haskell'
    select my_company.name,      from: 'job[company_id]'
    select new_category.name,     from: 'job[category_id]'
    select new_contract.name,     from: 'job[contract_id]'
    fill_in 'job[location]',      with: 'RS'
    fill_in 'job[description]',   with: 'tt duas vezes'

    click_on 'submit'

    expect(page).to have_content 'Developer Haskell'
    expect(page).to have_content my_company.name
    expect(page).to have_content new_category.name
    expect(page).to have_content new_contract.name
    expect(page).to have_content 'RS'
    expect(page).to have_content 'tt duas vezes'
    expect(page).to have_content 'PJ'
  end

  scenario "User can't edit their own jobs" do
    user = login_user

    my_company = create_company(name:"Campus Code",user:user)
    other_company = create_company(name:"Campus Code",
                                   user:create_user(email:'otheruser@other.com',password:'98765432'))


    new_category = create_category(name:"Analista QA")
    new_contract = create_contract(name:"PJ")

    job1 = create_job(company: my_company)
    job2 = create_job(company: other_company)

    visit edit_job_path(job2)
    expect(page).to have_content "Warning:You can't edit jobs of other users"

  end

  scenario 'Redirected to Sign in when he is not logged' do
    job = create_job
    visit edit_job_path(job)

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

  end

  scenario 'user wants to feature a job' do
    user = login_user
    my_company = create_company(name:"Campus Code",user:user)
    new_category = create_category(name:"Analista QA")
    new_contract = create_contract(name:"Freelancer")
    job = create_job(company:my_company)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: 'Developer Haskell'
    select my_company.name,       from: 'job[company_id]'
    select new_category.name,     from: 'job[category_id]'
    select new_contract.name,     from: 'job[contract_id]'
    fill_in 'job[location]',      with: 'RS'
    fill_in 'job[description]',   with: 'tt duas vezes'
    check 'job[featured]'

    click_on 'submit'

    expect(page).to have_content 'Developer Haskell'
    expect(page).to have_content my_company.name
    expect(page).to have_content new_category.name
    expect(page).to have_content new_contract.name
    expect(page).to have_content 'RS'
    expect(page).to have_content 'tt duas vezes'
    expect(page).to have_content 'Vaga em Destaque'
    expect(page).to have_content 'Freelancer'

  end

  scenario "fields can't be blank" do
    user = login_user
    my_company = create_company(name:"Campus Code",user:user)
    new_category = create_category(name:"Analista QA")
    job = create_job(company:my_company)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: ''

    within '#job_company_id'  do find("option[value='']").click end
    within '#job_company_id'  do find("option[value='']").click end
    within '#job_contract_id' do find("option[value='']").click end
    fill_in 'job[location]',      with: ''
    fill_in 'job[description]',   with: ''
    check 'job[featured]'

    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"


  end


end
