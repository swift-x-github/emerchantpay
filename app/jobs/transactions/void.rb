# frozen_string_literal: true

module Transactions
    class Void < ApplicationJob
      queue_as :system_high
  
      def perform(transaction_id, source_authorized_transaction)
  
        if Transaction.where(id: source_authorized_transaction)
           Transaction.where(id: source_authorized_transaction).update!(status: :voided)
           Transaction.where(id: transaction_id).update!(status: :approved)
        else
          Transaction.where(id: transaction_id).update!(status: :error)
        end
      end
    end
  end
  