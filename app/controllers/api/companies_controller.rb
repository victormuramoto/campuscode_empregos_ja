module Api
  class CompaniesController < Api::ApplicationController
    before_action :set_company, only:[:show]


    def show
      respond_with @company
    end


    private

    def set_company
      @company = Company.find(params[:id])
    end



  end
end
