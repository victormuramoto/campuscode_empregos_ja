require 'rails_helper'

feature 'User creates a new category' do

  scenario 'successfully' do
    user = login_user
    category = create_category

    visit new_category_path

    fill_in 'category[name]',     with: category.name
    click_on 'submit'

    expect(page).to have_content category.name
  end

  scenario 'invalid' do
    user = login_user
    visit new_category_path
    click_on 'submit'

    expect(page).to have_content "Warning! All fields are mandatory."
  end
end
