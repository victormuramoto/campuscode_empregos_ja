class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :set_collections, only: [:new, :create, :edit,:update]
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

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      flash[:warning] = "Warning: The fields can't be blank"
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title,:location,:category_id,:company_id,:description,:featured,:contract_id)
  end

  def set_collections
    @companies = current_user.companies
    @categories = Category.all
    @contracts = Contract.all
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
