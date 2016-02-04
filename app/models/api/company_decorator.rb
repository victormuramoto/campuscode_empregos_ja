module Api
  class CompanyDecorator < SimpleDelegator
    include Rails.application.routes.url_helpers

    def initialize(company)
      @companyD = company
    end

    def to_json(options = {})
      json.merge(paths).to_json
    end

    def json
      JSON.parse(@companyD.to_json)
    end

    def paths
      {jobs_path: jobs_api_company_path(@companyD)}
    end

  end

end
