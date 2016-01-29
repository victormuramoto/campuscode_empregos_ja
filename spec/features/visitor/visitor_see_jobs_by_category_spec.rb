require 'rails_helper'

feature 'visitor see job by category' do
  scenario 'visitor see list of categories' do
    category1 = create_category(name:'Developer')
    category2 = create_category(name:'Analista QA')

    visit root_path

    expect(page).to have_content category1.name
    expect(page).to have_content category2.name

  end

  scenario 'visitor see list of jobs available by category' do
    company = create_company
    category1 = create_category(name:'Locaweb')
    category2 = create_category(name:'Campus Code')

    job1 = create_job(title:'Dev C#',company: company,category: category1)
    job2 = create_job(title:'Dev Python',company:company,category: category1)
    job3 = create_job(title:'Dev Haskell',company:company,category: category1)

    job4 = create_job(title:'Dev Java',company:  company,category: category2)
    job5 = create_job(title:'Dev C++',company:  company,category: category2)
    job6 = create_job(title:'Dev Ruby',company:  company,category: category2)


    visit root_path

    click_on category1.name

    expect(page).to have_content job1.title
    expect(page).to have_content job1.category.name
    expect(page).to have_content job2.title
    expect(page).to have_content job2.category.name
    expect(page).to have_content job3.title
    expect(page).to have_content job3.category.name

    expect(page).to_not have_content job4.title
    expect(page).to_not have_content job4.category.name
    expect(page).to_not have_content job5.title
    expect(page).to_not have_content job5.category.name
    expect(page).to_not have_content job6.title
    expect(page).to_not have_content job6.category.name

  end


end
