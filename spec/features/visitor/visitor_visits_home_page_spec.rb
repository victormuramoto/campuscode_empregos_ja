require 'rails_helper'

feature 'visitor visits the home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Emprego Já')
  end
end
