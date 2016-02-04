class ContractsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  before_action :set_contract, only:[:show]

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.create(contract_params)
    respond_with @contract
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
