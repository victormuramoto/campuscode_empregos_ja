module ModelsMacros
  def create_job(attrs = {})
    Job.create({title:'Developer ruby',
              location:'SP',
              category:'Developer',
              description:'teste'}.merge(attrs))
  end

  def new_job(attrs= {})
    Job.new({title:'Developer ruby',
             location:'SP',
             category:'Developer',
             description:'teste'}.merge(attrs))
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


end
