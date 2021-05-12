class Api::V1::AccountsController < ApplicationController
  before_action :find_account, only: [:show, :update]

  def index
    accounts = Account.all 
    
    render json: accounts
  end
  
  def show
    render json: @account
  end

  def create
    # binding.pry
    # byebug
    account = Account.new(account_params)
    if account.save
      render json: account, status: :accepted
    else
      render json: { errors: account.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @account.update(account_params)
      render json: @account, status: :accepted
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:accountname, :password, :address)
  end

  def find_account
    @account = Account.find_by(id: params[:id])
  end
end
