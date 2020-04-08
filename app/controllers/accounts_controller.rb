class AccountsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    account = Account.create(account_params)

    if account.valid?
      payload = { account_id: account.id }
      token = encode_token(payload)

      render json: { account_id: account.id, token: token }
    else
      render json: { errors: account.errors.full_messages }, status: :not_acceptable
    end
  end

  def get_balance
    begin
      account = Account.find(params[:account_id])

      render json: { balance: account.balance }
    rescue => exception
      render json: { errors: exception.message }, status: :not_found
    end
  end

  private

  def account_params
    id_default = { id: SecureRandom.uuid }
    params.permit(:id, :username, :balance, :password, :password_confirmation).reverse_merge(id_default)
  end
end
