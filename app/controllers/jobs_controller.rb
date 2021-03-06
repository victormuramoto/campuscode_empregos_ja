class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :set_collections, only: [:new, :create, :edit,:update]
  before_action :set_job, only: [:edit, :show, :update]
  before_action :check_user, only: [:edit, :update]


  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    respond_with @job
  end

  def edit
    check_user
  end

  def update
    @job.update(job_params)
    respond_with @job
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

  def check_user
    if current_user != @job.company.user
      flash[:warning] = "Warning:You can't edit jobs of other users"
      redirect_to root_path
    end
  end

end
