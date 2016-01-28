require 'rails_helper'

feature 'User creates a new company' do

  scenario 'successfully' do
    user = login_user
    company = create_company(user:user)

    visit new_company_path

    fill_in 'company[name]',     with: company.name
    fill_in 'company[location]', with: company.location
    fill_in 'company[mail]',     with: company.mail
    fill_in 'company[phone]',    with: company.phone

    click_on 'submit'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
  end

  scenario 'invalid' do
    user = login_user
    visit new_company_path
    click_on 'submit'

    expect(page).to have_content "Warning! All fields are mandatory."
  end
end
