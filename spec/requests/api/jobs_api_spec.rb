require 'rails_helper'

describe "Jobs API" do
  it "User retrieves a specific job" do
    job = create(:job)

    get "/api/jobs/#{job.id}"

    expect(response).to be_success

    expect(json['title']).to eq(job.title)
    expect(json['location']).to eq(job.location)
    expect(json['description']).to eq(job.description)
    expect(json['contract_id']).to eq(job.contract.id)
    expect(json['company_path']).to eq("/api/companies/#{job.company.id}")
    expect(json['category_path']).to eq("/api/categories/#{job.category.id}")

    expect(json.has_key?('company_id')).to be false
    expect(json.has_key?('category_id')).to be false

  end

  it "User retrieves all jobs" do
    jobs = create_list(:job,2)

    get "/api/jobs"

    expect(response).to be_success

    jobs.each_with_index do |job,index|
      expect(json[index]['title']).to eq(job.title)
      expect(json[index]['location']).to eq(job.location)
      expect(json[index]['contract_id']).to eq(job.contract.id)
      expect(json[index]['description']).to eq(job.description)
      expect(json[index]['company_path']).to eq("/api/companies/#{job.company.id}")
      expect(json[index]['category_path']).to eq("/api/categories/#{job.category.id}")


      expect(json[index].has_key?('company_id')).to be false
      expect(json[index].has_key?('category_id')).to be false

    end
  end

end
