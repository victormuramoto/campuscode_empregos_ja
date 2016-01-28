require 'rails_helper'

feature 'User edits a company' do
  scenario 'successfully' do
    user = login_user

    company = create_company(user: user)

    visit edit_company_path(company)

    fill_in 'company[name]',     with: 'Code Campus'
    fill_in 'company[location]', with: 'Recife'
    fill_in 'company[mail]',     with: 'contat@codecampus.com.br'
    fill_in 'company[phone]',    with: '1111-5555'

    click_on 'submit'

    edited_company = find_company(company.id)

    expect(page).to have_content edited_company.name
    expect(page).to have_content edited_company.location
    expect(page).to have_content edited_company.mail
    expect(page).to have_content edited_company.phone
  end

  scenario 'unsuccessfully' do
    user = login_user

    company = create_company

    visit edit_company_path(company)

    expect(page).to have_content "Warning: Your user can't edit a company that don't belong to you"

  end
end
