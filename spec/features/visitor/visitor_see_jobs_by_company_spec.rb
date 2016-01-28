require 'rails_helper'

feature 'visitor see job by company' do
  scenario 'visitor see list of companies' do
    company1 = create_company(name:'Locaweb')
    company2 = create_company(name:'Campus Code')

    visit root_path

    expect(page).to have_content company1.name
    expect(page).to have_content company2.name

  end

  scenario 'visitor see list of jobs available by company' do
    company1 = create_company(name:'Locaweb')
    company2 = create_company(name:'Campus Code')

    job1 = create_job(title:'Dev C#',company: company1,category: create_category)
    job2 = create_job(title:'Dev Python',company:company1,category: create_category)
    job3 = create_job(title:'Dev Haskell',company:company1,category: create_category)

    job4 = create_job(title:'Dev Java',company:  company2,category: create_category)
    job5 = create_job(title:'Dev C++',company:  company2,category: create_category)
    job6 = create_job(title:'Dev Ruby',company:  company2,category: create_category)


    visit root_path

    click_on company1.name

    expect(page).to have_content job1.title
    expect(page).to have_content job1.company.name
    expect(page).to have_content job2.title
    expect(page).to have_content job2.company.name
    expect(page).to have_content job3.title
    expect(page).to have_content job3.company.name

    expect(page).to_not have_content job4.title
    expect(page).to_not have_content job4.company.name
    expect(page).to_not have_content job5.title
    expect(page).to_not have_content job5.company.name
    expect(page).to_not have_content job6.title
    expect(page).to_not have_content job6.company.name

  end


end
