class AuthController < ApplicationController
  skip_before_action :require_login, only: [:signin]

  def signin
    account = Account.find_by(username: params[:username])
    if account && account.authenticate(params[:password])
      payload = { account_id: account.id }
      token = encode_token(payload)
      render json: { account: account, token: token }
    else
      render json: { failure: "Log in failed!" }, status: :unprocessable_entity
    end
  end
end
