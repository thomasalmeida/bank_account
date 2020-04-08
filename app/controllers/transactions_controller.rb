class TransactionsController < ApplicationController
  before_action :check_balance, only: [:create]

  def create
    transaction = Transaction.create(
      source: Account.find_by(id: transaction_params[:source]),
      destination: Account.find_by(id: transaction_params[:destination]),
      amount: transaction_params[:amount]
    )

    if transaction.valid?
      update_balance(transaction.source, transaction.destination, transaction.amount)
      render json: { message: 'transaction succeeded', source: transaction.source.balance, destination: transaction.destination.balance }
    else
      render json: { errors: transaction.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def transaction_params
    params.permit(:source, :destination, :amount)
  end

  def check_balance
    account = Account.find_by(id: params[:source])
    if account.balance < params[:amount].to_f
      render json: { failure: 'not balance' }, status: :not_acceptable
    end
  end

  def update_balance(source_account, destination_account, amount)
    source_account.update_attribute(:balance, source_account.balance - amount)
    destination_account.update_attribute(:balance, destination_account.balance + amount)
  end
end
