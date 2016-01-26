module ModelsMacros
  def create_company
    Company.create(name: 'Campus Code',
                   location: 'São Paulo',
                   phone: '11 2369 3476',
                   mail: 'contato@campuscode.com.br')
  end

  def create_category
    Category.create(name: 'Desenvolvedor')
  end

  def create_job(company = nil, category = nil)
    company ||= create_company
    category ||= create_category
    contract = Contract.create(name: 'CLT')
    company.jobs.create(title: 'Desenvolvedor Rails',
               description: 'Desenvolvedor Full Stack Rails',
               location: 'São Paulo - SP',
               category: category,
               contract: contract)
  end

  def login_user
    user = User.create(email: 'allan@a.com.br', password:'12345678')


    visit new_user_session_path

    fill_in 'user[email]',     with: 'allan@a.com.br'
    fill_in 'user[password]',     with: '12345678'

    click_on 'Log in'

    user
  end
end
