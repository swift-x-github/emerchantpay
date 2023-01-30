module Transactions
  class AddTransaction
    
    def create(params)
      if params[:type] == "Authorize"
        ActiveRecord::Base.transaction do

          transaction = Transaction
            .create!(
              user_id: params[:user_id],
              amount: params[:amount],
              customer_email: params[:customer_email],
              customer_phone: params[:customer_phone],
              transaction_id: params[:transaction_id], 
              notification_url: params[:notification_url],
              type: params[:type]
          )
          ::Transactions::Authorize
            .perform_later(
              transaction.id,
              params[:amount],
              params[:notification_url],
              params[:customer_email],
              params[:user_id]
          )

        end
      elsif params[:type] == "Capture"
        ActiveRecord::Base.transaction do

          source_authorize_transaction = Transaction.find_by(id: params[:transaction_id])
          if source_authorize_transaction.approved? || source_authorize_transaction.captured?
            transaction = Transaction
              .create!(
                user_id: source_authorize_transaction.user_id,
                amount: params[:amount],
                customer_email: source_authorize_transaction.customer_email,
                customer_phone: source_authorize_transaction.customer_phone,
                transaction_id: params[:transaction_id], 
                notification_url: source_authorize_transaction,
                type: params[:type]
            )
            ::Transactions::Capture
              .perform_later(
                transaction.id,
                params[:amount],
                source_authorize_transaction.notification_url,
                source_authorize_transaction.customer_email,
                source_authorize_transaction.user_id
              )
          end

        end
      end
    end

  end
end
