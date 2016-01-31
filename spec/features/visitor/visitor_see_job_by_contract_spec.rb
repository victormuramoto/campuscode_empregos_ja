require 'rails_helper'

feature 'visitor see job by contract type' do
  scenario 'visitor see list of contracts' do
    contract1 = create_contract(name:'PJ')
    contract2 = create_contract(name:'Freelancer')

    visit root_path

    expect(page).to have_content contract1.name
    expect(page).to have_content contract2.name

  end

  scenario 'visitor see list of jobs available by contract' do
    contract1 = create_contract(name:'PJ')
    contract2 = create_contract(name:'Freelancer')

    job1 = create_job(title:'Dev C#',contract: contract1,category: create_category)
    job2 = create_job(title:'Dev Python',contract:contract1,category: create_category)
    job3 = create_job(title:'Dev Haskell',contract:contract1,category: create_category)

    job4 = create_job(title:'Dev Java',contract:  contract2,category: create_category)
    job5 = create_job(title:'Dev C++',contract:  contract2,category: create_category)
    job6 = create_job(title:'Dev Ruby',contract:  contract2,category: create_category)


    visit root_path

    click_on contract1.name

    expect(page).to have_content job1.title
    expect(page).to have_content job1.contract.name
    expect(page).to have_content job2.title
    expect(page).to have_content job2.contract.name
    expect(page).to have_content job3.title
    expect(page).to have_content job3.contract.name

    expect(page).to_not have_content job4.title
    expect(page).to_not have_content job4.contract.name
    expect(page).to_not have_content job5.title
    expect(page).to_not have_content job5.contract.name
    expect(page).to_not have_content job6.title
    expect(page).to_not have_content job6.contract.name

  end



end
