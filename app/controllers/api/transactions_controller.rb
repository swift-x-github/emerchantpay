module Api
  class TransactionsController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def create
      ::Transactions::AddTransaction.new.create(permit_params)
    end
   
    private

    def permit_params
      params.require(:transaction).permit(
        :type, :user_id, :amount, :customer_email, :customer_phone, :transaction_id, :notification_url
      )
    end

  end
end