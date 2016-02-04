require 'rails_helper'

describe "Companies API" do
  it "User retrieves a specific company" do
    company = create(:company)

    get "/api/companies/#{company.id}"

    expect(response).to be_success

    expect(json['name']).to eq(company.name)
    expect(json['location']).to eq(company.location)
    expect(json['phone']).to eq(company.phone)
    expect(json['email']).to eq(company.email)
  end

  it "User retrieves all jobs from a specific company" do
    company = create(:company)
    category = create(:category)
    contract = create(:contract)

    jobs = create_list(:job,2,company:company,category:category,contract:contract)

    get "/api/companies/#{jobs[0].company.id}/jobs"

    expect(response).to be_success

    jobs.each_with_index do |job,index|
      expect(json[index]['title']).to eq(job.title)
      expect(json[index]['location']).to eq(job.location)
      expect(json[index]['company_id']).to eq(job.company.id)
      expect(json[index]['category_id']).to eq(job.category.id)
      expect(json[index]['contract_id']).to eq(job.contract.id)
      expect(json[index]['description']).to eq(job.description)
    end


  end



end
