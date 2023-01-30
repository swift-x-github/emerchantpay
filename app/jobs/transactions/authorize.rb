# frozen_string_literal: true

module Transactions
  class Authorize < ApplicationJob
    queue_as :system_high

    def perform(transaction_id, amount, notification_url, customer_email)
      uri = URI(notification_url)
      res = Net::HTTP.post_form(uri, 'customer_email' => customer_email, 'amount' => amount)
      result = JSON.parse(res.body)['data']['attributes']['allow_authorize']

      if result == true
        Transaction.where(id: transaction_id).update!(status: :approved)
        old_client_captured_summa = Client.find_by(customer_email: customer_email)
                                          .captured_amount.to_f
        Client.find_by(customer_email: customer_email)
              .update(captured_amount: old_client_captured_summa + amount)
      else
        Transaction.where(id: transaction_id).update!(status: :declined)
      end
    end
  end
end
