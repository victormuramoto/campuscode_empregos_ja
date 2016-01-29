class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
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

  private

  def company_params
    params.require(:company).permit(:name,:location,:email,:phone)
  end


end
