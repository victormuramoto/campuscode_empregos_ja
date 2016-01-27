class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @jobs = Job.joins(company: :user).where(companies:{user_id: current_user.id})
    @companies = current_user.companies
    @categories = Category.joins(job: :company).where(companies:{user_id: current_user.id})
    @contracts = Contract.all

    render 'home/index'
  end

end
