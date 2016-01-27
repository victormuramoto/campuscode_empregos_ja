class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_collections, only: [:new, :create, :edit, :update]
  before_action :set_job, only: [:edit, :show, :update]
  before_action :user_owner, only: [:edit,:update]

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  private

  def set_collections
    @categories = Category.all
    @companies = current_user.companies
    @contracts = Contract.all
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def user_owner
    if current_user != @job.company.user
      flash[:warning] = "Warning: Your user can't edit a job that don't belong to you"
      redirect_to root_path
    end
  end

  def job_params
    params.require(:job)
      .permit(:title, :location, :category_id, :description, :featured,
             :company_id, :contract_id)
  end
end
