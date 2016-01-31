require 'rails_helper'

feature 'User create contracts' do
  scenario 'success' do
    login_user
    contract = new_contract

    visit new_contract_path

    fill_in 'contract[name]',      with: contract.name

    click_on 'submit'

    expect(page).to have_content contract.name

  end

  scenario 'Redirected to Sign in when he is not logged' do

    visit new_contract_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

  end

  scenario "fields can't be blank" do
    login_user
    visit new_contract_path

    click_on 'submit'

    expect(page).to have_content "Warning: The fields can't be blank"

  end
end
