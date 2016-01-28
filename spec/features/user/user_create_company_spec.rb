require 'rails_helper'

feature 'user create a company' do
  scenario 'success' do
    company = new_company

    visit new_company_path

    fill_in 'Nome',        with: company.name
    fill_in 'Localização',    with: company.location
    fill_in 'Email',       with: company.email
    fill_in 'Telefone',    with: company.phone

    click_on 'Criar Empresa'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.email
    expect(page).to have_content company.phone
  end
end
