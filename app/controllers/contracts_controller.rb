class ContractsController < ApplicationController
  before_action :set_contract, only:[:show]

  def show

  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
