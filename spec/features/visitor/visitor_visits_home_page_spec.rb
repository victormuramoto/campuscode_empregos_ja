require 'rails_helper'

feature 'visitor visits the home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Emprego Já')
  end

  scenario 'visitor can see jobs in home page'do
    Job.create(title:'Developer ruby',
              location:'SP',
              company:'Locaweb',
              category:'Developer',
              description:'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

    Job.create(title:'Full Stack Python',
              location:'SP',
              company:'Locaweb',
              category:'Developer',
              description:'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
    visit root_path

    expect(page).to have_content('Developer ruby')
    expect(page).to have_content('SP')
    expect(page).to have_content('Locaweb')
    expect(page).to have_content('Developer')
    expect(page).to have_content('Python')
    
  end
end
