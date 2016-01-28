class JobsController < ApplicationController
  before_action :set_collections, only: [:new, :create, :edit]
  before_action :set_job, only: [:edit, :show, :update]

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash[:warning] = "Warning: The fields can't be blank"
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title,:location,:category,:company_id,:description,:featured)
  end

  def set_collections
    @companies = Company.all
    @categories = Category.all
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
