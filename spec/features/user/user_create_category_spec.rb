require 'rails_helper'

feature 'User create categories' do
  scenario 'success' do
    category = new_category

    visit new_category_path

    fill_in 'category[name]',      with: category.name

    click_on 'submit'

    expect(page).to have_content category.name

  end
end
