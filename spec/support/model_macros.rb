module ModelsMacros
  def create_job(attrs = {})
   attrs[:category] ||= create_category
   attrs[:contract] ||= create_contract
   attrs[:company]  ||= create_company

    Job.create({title:'Developer ruby',
              location:'SP',
              description:'teste',
              featured:true}.merge(attrs))
  end

  def new_job(attrs= {})
    attrs[:category] ||= create_category
    attrs[:contract] ||= create_contract
    attrs[:company]  ||= create_company
    Job.new({title:'Developer ruby',
             location:'SP',
             description:'teste',
             featured:true}.merge(attrs))
  end

  def create_company(attrs = {})
    Company.create({name:'Locaweb',
                  location:'SP',
                  email:'rh@locaweb.com.br',
                  phone:'1212-1212'}.merge(attrs))
  end

  def new_company(attrs = {})
    Company.new({name:'Locaweb',
                  location:'SP',
                  email:'rh@locaweb.com.br',
                  phone:'1212-1212'}.merge(attrs))
  end

  def create_category(attrs = {})
    Category.create({name:"Desenvolvedor"}.merge(attrs))
  end

  def new_category(attrs= {})
    Category.new({name:"Desenvolvedor"}.merge(attrs))
  end

  def create_user(attrs= {})
    User.create({email:"user@user.com",password:"12345678"}.merge(attrs))
  end

  def login_user(attrs= {})
    user = create_user(attrs)
    visit new_user_session_path

    fill_in 'user[email]',           with: user.email
    fill_in 'user[password]',        with: user.password

    click_on 'Log in'
    user
  end

  def create_contract(attrs = {})
    Contract.create({name:"CLT"}.merge(attrs))
  end
  def new_contract(attrs = {})
    Contract.new({name:"CLT"}.merge(attrs))
  end
end
