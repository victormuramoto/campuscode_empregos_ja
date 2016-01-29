require 'rails_helper'

feature 'User can edit company' do
  scenario 'success' do
    company1 = create_company
    company2 = new_company(name:'Campus Code',
                          location:"RS",
                          email:'rh@campuscode.com.br',
                          phone: '4545-4545')

    visit edit_company_path(company1)

    fill_in 'company[name]',         with:company2.name
    fill_in 'company[location]',     with:company2.location
    fill_in 'company[email]',        with:company2.email
    fill_in 'company[phone]',        with:company2.phone

    click_on 'submit'

    expect(page).to have_content company2.name
    expect(page).to have_content company2.location
    expect(page).to have_content company2.email
    expect(page).to have_content company2.phone

  end
end