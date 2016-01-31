class HomeController < ApplicationController

  def index

    @jobs = check_expired_job
    @companies = Company.all
    @categories = Category.all
    @contracts = Contract.all
  end

  def check_expired_job
    jobs = []
    Job.all.each do |job|
      if !job.expired?
        jobs << job
      end
    end
    jobs
  end
end
