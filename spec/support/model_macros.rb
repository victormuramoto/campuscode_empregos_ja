require 'securerandom'

module ModelsMacros
  def create_company(attrs = {})
    attrs[:user] ||= create_user
    Company.create({name: 'Campus Code',
                   location: 'São Paulo',
                   phone: '11 2369 3476',
                   mail: 'contato@campuscode.com.br'}.merge(attrs))
  end

  def create_category(attrs = {})
    Category.create({name: 'Desenvolvedor'}.merge(attrs))
  end

  def create_contract(attrs = {})
    Contract.create({name: 'CLT'}.merge(attrs))
  end

  def create_job(company = nil, attrs = {})
    company ||= create_company
    attrs[:category] ||= create_category
    attrs[:contract] ||= create_contract
    company.jobs.create({title: "Desenvolvedor Rails #{SecureRandom.hex}",
               description: "Desenvolvedor Full Stack Rails #{SecureRandom.hex}",
               location: 'São Paulo - SP'}.merge(attrs))
  end

  def create_user
    User.create(email: 'allan@a.com.br', password:'12345678')
  end

  def login_user(user = nil)
    user ||= create_user

    visit new_user_session_path

    fill_in 'user[email]',     with: user.email
    fill_in 'user[password]',  with: user.password

    click_on 'Log in'

    user
  end
end
