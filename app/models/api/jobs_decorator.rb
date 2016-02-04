module Api
  class JobsDecorator < SimpleDelegator
    include Rails.application.routes.url_helpers

    def initialize(jobs)
      @jobsD = jobs
    end

    def to_json(options = {})
      result = []
      @jobsD.each do |job|
        result << json(job).merge(paths(job)).except('company_id','category_id')
      end
      result.to_json
    end

    def json(job)
      JSON.parse(job.to_json)
    end

    def paths(job)
      {company_path: api_company_path(job.company),
       category_path:api_category_path(job.category)}
    end

  end
end
