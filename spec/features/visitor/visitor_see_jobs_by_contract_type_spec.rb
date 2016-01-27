require 'rails_helper'

feature 'Visitor see jobs by contract type' do
  scenario 'visitor see contracts on home' do

    contract_1 = create_contract
    contract_2 = create_contract({name: 'PJ'})
    contract_3 = create_contract({name: 'Freelancer'})

    visit root_path

    expect(page).to have_content contract_1.name
    expect(page).to have_content contract_2.name
    expect(page).to have_content contract_3.name
  end

  scenario 'visitor see jobs by contracts page' do

    contract_1 = create_contract
    contract_2 = create_contract({name: 'PJ'})

    job_1 = create_job(nil,nil,contract_1)
    job_2 = create_job(nil,nil,contract_2)

    visit root_path

    click_on contract_1.name

    expect(page).to have_content job_1.title
    expect(page).to have_content job_1.category.name
    expect(page).to have_content job_1.location
    expect(page).to have_content job_1.description

    expect(page).to_not have_content job_2.title
    expect(page).to_not have_content job_2.description
  end
end
