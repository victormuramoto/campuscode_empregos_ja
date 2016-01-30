require 'rails_helper'

feature 'User can edit company' do
  scenario 'success' do
    login_user
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

  scenario 'Redirected to Sign in when he is not logged' do
    company1 = create_company
    visit edit_company_path(company1)

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

  end

  scenario "fields can't be blank" do
    login_user
    company1 = create_company

    visit edit_company_path(company1)

    fill_in 'company[name]',         with:''
    fill_in 'company[location]',     with:''
    fill_in 'company[email]',        with:''
    fill_in 'company[phone]',        with:''

    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"

  end
end
