require 'rails_helper'

feature 'User can edit company' do
  scenario 'success' do
    user = login_user
    company1 = create_company(user:user)
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

  scenario 'user edit a company and change the logo'  do
    login_user
    company = new_company

    visit new_company_path

    fill_in 'company[name]',        with: company.name
    fill_in 'company[location]',    with: company.location
    fill_in 'company[email]',       with: company.email
    fill_in 'company[phone]',       with: company.phone
    page.attach_file('company[company_image]', Rails.root + 'app/assets/images/twitter.jpg')

    click_on 'Criar Empresa'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.email
    expect(page).to have_content company.phone
    expect(page).to have_css("img[src*='company_image.jpg']")
  end

  scenario "User can't edit companies of other users" do
    user = login_user

    company1 = create_company(user:user)
    company2 = create_company(name:'Campus Code',
                          location:"RS",
                          email:'rh@campuscode.com.br',
                          phone: '4545-4545',
                          user:create_user(email:'otheruser@other.com.br', password:'98765432'))

    visit edit_company_path(company2)

    expect(page).to have_content "Warning:You can't edit companies of other users"

  end

  scenario 'Redirected to Sign in when he is not logged' do
    company1 = create_company
    visit edit_company_path(company1)

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

  end

  scenario "fields can't be blank" do
    user = login_user
    company1 = create_company(user:user)

    visit edit_company_path(company1)

    fill_in 'company[name]',         with:''
    fill_in 'company[location]',     with:''
    fill_in 'company[email]',        with:''
    fill_in 'company[phone]',        with:''

    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"

  end
end
