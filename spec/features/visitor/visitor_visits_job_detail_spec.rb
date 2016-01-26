require 'rails_helper'

feature 'Visitor visits job details' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = create_job(company,category)

    visit root_path

    click_on 'Ver mais'

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
    expect(page).to have_content job.contract.name

  end
end
