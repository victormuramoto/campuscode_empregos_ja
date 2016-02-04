class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :set_category, only: [:show]
  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    respond_with @category
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
