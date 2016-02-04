FactoryGirl.define do
  factory :contract do
    name 'Freelancer'
  end
end

FactoryGirl.define do
  factory :category do
    name 'Desenvolvedor'
  end
end

FactoryGirl.define do
  factory :company do
    name 'Campus Code'
    location 'São Paulo'
    phone '11 2369 3476'
    email 'contato@campuscode.com.br'
  end
end

FactoryGirl.define do
  factory :job do
    title 'Desenvolvedor Rails'
    description 'Desenvolvedor Full Stack Rails'
    location 'São Paulo - SP'
    category
    contract
    company
  end
end
