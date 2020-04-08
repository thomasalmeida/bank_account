class AccountsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
  end

  private

  def account_params
    id_default = { id: SecureRandom.uuid }
    params.permit(:id, :username, :balance, :password, :password_confirmation).reverse_merge(id_default)
  end
end
