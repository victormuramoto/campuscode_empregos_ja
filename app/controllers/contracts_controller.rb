class ContractsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  before_action :set_contract, only:[:show]

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      flash[:warning] = "Warning: The fields can't be blank"
      render :new
    end
  end

  def show
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:name)
  end
end
