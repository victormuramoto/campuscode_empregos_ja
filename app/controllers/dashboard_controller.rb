class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @jobs = current_user.jobs
    @companies = current_user.companies
    @categories = current_user.categories
    @contracts = current_user.contracts
  end

end
