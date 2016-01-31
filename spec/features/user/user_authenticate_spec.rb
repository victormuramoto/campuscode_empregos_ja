require 'rails_helper'

feature 'Authenticate user' do

  scenario 'successfully' do
    login_user

    visit root_path

    expect(page).to have_content 'Usuário Logado'
  end

  scenario 'unsuccessfully' do
    visit root_path

    expect(page).to_not have_content 'Usuário Logado'
  end

end
