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
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      flash[:warning] = "Warning: The fields can't be blank"
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to @company
    else
      flash[:warning] = "Warning: The fields can't be blank"
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name,:location,:email,:phone,:user_id)
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
