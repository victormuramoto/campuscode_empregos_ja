require 'rails_helper'

describe "Jobs API" do
  it "User retrieves a specific job" do
    job = create(:job)

    get "/api/jobs/#{job.id}"

    expect(json['title']).to eq(job.title)
    expect(json['location']).to eq(job.location)
    expect(json['company_id']).to eq(job.company.id)
    expect(json['category_id']).to eq(job.category.id)
    expect(json['contract_id']).to eq(job.contract.id)
    expect(json['description']).to eq(job.description)
  end

end
