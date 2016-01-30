module ModelsMacros
  def create_job(attrs = {})
    Job.create({title:'Developer ruby',
              location:'SP',
              description:'teste',
              featured:true}.merge(attrs))
  end

  def new_job(attrs= {})
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
    user = create_user
    visit new_user_session_path

    fill_in 'user[email]',           with: user.email
    fill_in 'user[password]',        with: user.password

    click_on 'Log in'
  end

end
