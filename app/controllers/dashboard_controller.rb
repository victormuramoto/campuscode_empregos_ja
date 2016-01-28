class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @jobs = Job.joins(company: :user).where(companies:{user_id: current_user.id})
    @companies = current_user.companies
    @categories = Category.joins(jobs: :company).where(companies:{user_id: current_user.id}).group(:id)
    @contracts = Contract.joins(jobs: :company).where(companies:{user_id: current_user.id}).group(:id)

    render 'home/index'
  end

end
