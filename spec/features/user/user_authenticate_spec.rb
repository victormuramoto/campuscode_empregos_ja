require 'rails_helper'

feature 'Authenticate user' do

  scenario 'successfully' do
    login_user

    visit root_path

    expect(page).to have_content 'Usuário Logado'
  end

  scenario 'unsuccessfully' do
    visit root_path

    expect(page).to_not have_content 'Usuário Logado'
  end

  scenario 'User logged accessing jobs new method' do
    user = login_user

    visit new_job_path

    expect(page).to have_content 'Nova Vaga'
  end

  scenario 'User not logged accessing jobs new method' do
    visit new_job_path

    expect(page).to have_content 'Log in'
  end

  scenario 'User not logged accessing jobs edit method' do
    job = create_job
    visit edit_job_path(job)

    expect(page).to have_content 'Log in'
  end

  scenario 'User not logged accessing categories new method' do
    visit new_category_path

    expect(page).to have_content 'Log in'
  end

  scenario 'User not logged accessing companies new method' do
    visit new_company_path

    expect(page).to have_content 'Log in'
  end

  scenario 'User not logged accessing companies edit method' do
    company = create_company
    visit edit_company_path(company)

    expect(page).to have_content 'Log in'
  end
end
