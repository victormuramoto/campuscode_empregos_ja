require 'rails_helper'

feature 'User edit job' do
  scenario 'success' do
    new_company = create_company(name:"Campus Code")
    new_category = create_category(name:"Analista QA")
    job = create_job(company: create_company, category: create_category)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: 'Developer Haskell'
    select new_company.name,      from: 'job[company_id]'
    select new_category.name,     from: 'job[category_id]'
    fill_in 'job[location]',      with: 'RS'
    fill_in 'job[description]',   with: 'tt duas vezes'

    click_on 'submit'

    expect(page).to have_content 'Developer Haskell'
    expect(page).to have_content new_company.name
    expect(page).to have_content new_category.name
    expect(page).to have_content 'RS'
    expect(page).to have_content 'tt duas vezes'


  end

  scenario 'user wants to feature a job' do
    new_company = create_company(name:"Campus Code")
    new_category = create_category(name:"Analista QA")
    job = create_job(company: create_company, category: create_category)

    visit edit_job_path(job)

    fill_in 'job[title]',         with: 'Developer Haskell'
    select new_company.name,      from: 'job[company_id]'
    select new_category.name,     from: 'job[category_id]'
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


  end
end
