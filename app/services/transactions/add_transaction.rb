# frozen_string_literal: true

module Transactions
  class AddTransaction
    def create(params)
      case params[:type]
      when 'Authorize'
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
              params[:customer_email]
            )
        end
      when 'Capture'
        ActiveRecord::Base.transaction do
          source_authorize_transaction = Transaction.authorized.find_by(id: params[:transaction_id])
          if source_authorize_transaction.approved? || source_authorize_transaction.captured?
            transaction = Transaction
                          .create!(
                            user_id: source_authorize_transaction.user_id,
                            amount: params[:amount],
                            customer_email: source_authorize_transaction.customer_email,
                            customer_phone: source_authorize_transaction.customer_phone,
                            transaction_id: params[:transaction_id],
                            notification_url: source_authorize_transaction.notification_url,
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
      when 'Refund'
        ActiveRecord::Base.transaction do
          source_captured_transaction = Transaction.captured.find_by(id: params[:transaction_id])
          if source_captured_transaction.approved? || source_captured_transaction.refunded?
            transaction = Transaction
                          .create!(
                            user_id: source_captured_transaction.user_id,
                            amount: params[:amount],
                            customer_email: source_captured_transaction.customer_email,
                            customer_phone: source_captured_transaction.customer_phone,
                            transaction_id: params[:transaction_id],
                            notification_url: source_captured_transaction.notification_url,
                            type: params[:type],
                            status: :refunded
                          )
            ::Transactions::Refund
            .perform_later(
              transaction.id,
              params[:amount],
              source_captured_transaction.notification_url,
              source_captured_transaction.customer_email,
              source_captured_transaction.user_id,
              source_captured_transaction.amount
            )
          end
        end
      end
    end
  end
end
