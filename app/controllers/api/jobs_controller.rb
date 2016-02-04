module Api
  class JobsController < Api::ApplicationController
    before_action :set_job, only: [:show]

    def index
      @jobs = Job.all
      @jobsD = JobsDecorator.new(@jobs)
      respond_with @jobsD
    end

    def show
      @jobD = JobDecorator.new(@job)
      respond_with @jobD
    end

    private

    def set_job
      @job = Job.find(params[:id])
    end

  end
end
