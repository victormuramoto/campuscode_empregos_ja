require 'rails_helper'

describe "Jobs API" do
  it "User retrieves a specific job" do
    job = create(:job)

    get "/api/jobs/#{job.id}"

    expect(response).to be_success

    expect(json['title']).to eq(job.title)
    expect(json['location']).to eq(job.location)
    expect(json['company_id']).to eq(job.company.id)
    expect(json['category_id']).to eq(job.category.id)
    expect(json['contract_id']).to eq(job.contract.id)
    expect(json['description']).to eq(job.description)
  end

  it "User retrieves all jobs" do
    jobs = create_list(:job,2)

    get "/api/jobs"

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
