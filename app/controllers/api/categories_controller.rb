module Api
  class CategoriesController < Api::ApplicationController
    before_action :set_category, only: [:show]
    def show
      respond_with @category
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end
  end
end
