module Api
  class JobDecorator < SimpleDelegator
    include Rails.application.routes.url_helpers

    def initialize(job)
      @jobD = job
    end

    def to_json(options = {})
      json.merge(paths).except('company_id','category_id').to_json
    end

    def json
      JSON.parse(@jobD.to_json)
    end

    def paths
      {company_path: api_company_path(@jobD.company),
       category_path:api_category_path(@jobD.category)}
    end

  end
end
