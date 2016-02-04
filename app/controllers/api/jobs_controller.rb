module Api
  class JobsController < Api::ApplicationController
    before_action :set_job, only: [:show]

    def index
      @jobs = Job.all
      respond_with @jobs
    end

    def show
      respond_with @job
    end

    private

    def set_job
      @job = Job.find(params[:id])
    end

  end
end
