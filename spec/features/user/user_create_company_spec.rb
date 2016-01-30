require 'rails_helper'

feature 'user create a company' do
  scenario 'success' do
    login_user
    company = new_company

    visit new_company_path

    fill_in 'company[name]',        with: company.name
    fill_in 'company[location]',    with: company.location
    fill_in 'company[email]',       with: company.email
    fill_in 'company[phone]',       with: company.phone

    click_on 'Criar Empresa'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.email
    expect(page).to have_content company.phone
  end

  scenario 'Redirected to Sign in when he is not logged' do

    visit new_company_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

  end

  scenario "fields can't be blank" do
    login_user
    visit new_company_path
    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"

  end
end
