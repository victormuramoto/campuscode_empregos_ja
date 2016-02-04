module Api
  class CompanyDecorator < SimpleDelegator
    include Rails.application.routes.url_helpers

    def to_json(options = {})
      json.merge(paths).to_json
    end

    def json
      JSON.parse(__getobj__.to_json)
    end

    def paths
      {jobs_path: jobs_api_company_path(__getobj__)}
    end

  end

end
