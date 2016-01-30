require 'rails_helper'

feature 'User create categories' do
  scenario 'success' do
    login_user
    category = new_category

    visit new_category_path

    fill_in 'category[name]',      with: category.name

    click_on 'submit'

    expect(page).to have_content category.name

  end

  scenario 'Redirected to Sign in when he is not logged' do

    visit new_category_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

  end

  scenario "fields can't be blank" do
    login_user
    visit new_category_path

    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"

  end
end
