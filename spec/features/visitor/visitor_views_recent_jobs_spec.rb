require 'rails_helper'

feature 'Visitor view recent jobs' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')
    job = create_job(company, {category: category})

    visit root_path

    # primeira elemento com o css "jobs" da pagina
    within('.jobs:first-child') do
      expect(page).to have_content('Novidade')
    end
  end
end
