class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :set_company, only:[:show,:edit,:update]
  before_action :check_user, only:[:edit,:update]

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params.merge(user: current_user))
    respond_with @company
  end

  def edit
  end

  def update
    @company.update(company_params)
    respond_with @company
  end

  private

  def company_params
    params.require(:company).permit(:name,:location,:email,:phone,:company_image)
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def check_user
    if current_user != @company.user
      flash[:warning] = "Warning:You can't edit companies of other users"
      redirect_to root_path
    end
  end


end
