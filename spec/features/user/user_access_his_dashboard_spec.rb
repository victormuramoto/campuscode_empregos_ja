require 'rails_helper'

feature 'User access his dashboard' do
  scenario 'successfully' do
    user = login_user

    company = create_company(user)
    category_1 = create_category(name:'Suporte')
    category_2 = create_category(name:'Infra')

    job_1 = create_job(company,category_1)
    job_2 = create_job(company,category_1)

    visit users_path

    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.company.name
    expect(page).to have_content job_1.category.name

    expect(page).to have_content job_2.title
    expect(page).to have_content job_2.location
    expect(page).to have_content job_2.company.name
    expect(page).to have_content job_2.category.name

    expect(page).to_not have_content category_2.name

  end

  scenario 'unsuccessfully' do
    visit users_path

    expect(page).to have_content "Log in"

  end

  scenario "User can't see data of other users" do
    user = login_user

    company = create_company(create_user)
    category_1 = create_category(name:'Suporte')
    category_2 = create_category(name:'Infra')

    job_1 = create_job(company,category_1)

    visit users_path

    expect(page).to_not have_content job_1.title
    expect(page).to_not have_content job_1.location
    expect(page).to_not have_content job_1.company.name
    expect(page).to_not have_content job_1.category.name

    expect(page).to_not have_content category_2.name

  end


end
