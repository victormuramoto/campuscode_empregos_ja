require 'rails_helper'

describe "Categories API" do
  it "User retrieves a specific category" do
    category = create(:category)

    get "/api/categories/#{category.id}"

    expect(response).to be_success

    expect(json['name']).to eq(category.name)
  end
end
