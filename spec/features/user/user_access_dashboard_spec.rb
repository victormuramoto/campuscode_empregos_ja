require 'rails_helper'

feature 'User access dashboard' do
  scenario 'success' do
    user = login_user
    company1 = create_company(user:user)


    job1 = create_job(company:company1)
    job2 = create_job(company:company1)
    visit dashboards_path

    expect(page).to have_content job1.title
    expect(page).to have_content job1.company.name
    expect(page).to have_content job1.category.name
    expect(page).to have_content job1.contract.name


    expect(page).to have_content job2.title
    expect(page).to have_content job2.company.name
    expect(page).to have_content job2.category.name
    expect(page).to have_content job2.contract.name

  end

  scenario 'failed' do

    visit dashboards_path

     expect(page).to have_content "Log in"
  end

  scenario "User can't see jobs of other users" do
    
    user = login_user
    company1 = create_company(user:user)
    company2 = create_company(name:'Campus Code',user:create_user(email:'otheruser@other.com.br', password:'98765432'))

    category = create_category(name:"Analista QA")
    contract = create_contract(name:"Freelancer")

    job1 = create_job(company:company1)
    job2 = create_job(title:'Dev c#',company:company2,category:category,contract: contract)
    visit dashboards_path

    expect(page).to have_content job1.title
    expect(page).to have_content job1.company.name
    expect(page).to have_content job1.category.name
    expect(page).to have_content job1.contract.name


    expect(page).to_not have_content job2.title
    expect(page).to_not have_content job2.company.name
    expect(page).to_not have_content job2.category.name
    expect(page).to_not have_content job2.contract.name

  end
end
