describe "Companies API" do
  it "User retrieves a specific company" do
    company = create(:company)

    get "/api/companies/#{company.id}"

    expect(json['name']).to eq(company.name)
    expect(json['location']).to eq(company.location)
    expect(json['phone']).to eq(company.phone)
    expect(json['email']).to eq(company.email)
  end




end
