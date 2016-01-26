require 'rails_helper'

feature 'Authenticate user' do

  scenario 'successfully' do
    user = User.create(name: 'Allan',
                       password:'123'.crypt('Allan')
    )

    visit login_users_path

    fill_in 'user[name]',     with: 'Allan'
    fill_in 'user[password]',     with: '123'

    click_on 'Logar'

    expect(page).to have_content 'Usuário Logado'

  end

  scenario 'unsuccessfully' do
    user = User.create(name: 'Allan',
                       password:'123'.crypt('Allan')
    )

    visit login_users_path

    fill_in 'user[name]',     with: 'Allan'
    fill_in 'user[password]',     with: 'abc'

    click_on 'Logar'

    expect(page).to_not have_content 'Usuário Logado'

  end

  scenario 'User logged accessing protected methods' do
    user = User.create(name: 'Allan',
                       password:'123'.crypt('Allan')
    )

    visit login_users_path

    fill_in 'user[name]',     with: 'Allan'
    fill_in 'user[password]',     with: '123'

    click_on 'Logar'

    if user.get_session
      visit new_job_path
    end
    expect(page).to have_content 'Nova Vaga'

  end

  scenario 'User not logged accessing protected methods' do
    user = User.create(name: 'Allan',
                       password:'123'.crypt('Allan')
    )
    visit new_job_path
    if !user.get_session
      expect(page).to have_content 'Logar'
    end

  end


end
