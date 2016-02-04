module Api
  class CompaniesController < Api::ApplicationController
    before_action :set_company, only:[:show,:jobs]


    def show
      @companyD = CompanyDecorator.new(@company)
      respond_with @companyD
    end

    def jobs
      @jobs = @company.jobs
      respond_with @jobs
    end


    private

    def set_company
      @company = Company.find(params[:id])
    end



  end
end
