# frozen_string_literal: true

module Transactions
  class Refund < ApplicationJob
    queue_as :system_high

    def perform(transaction_id, amount, notification_url, customer_email, merchant, 
                source_captured_transaction_captured_amount)
      uri = URI(notification_url)
      res = Net::HTTP.post_form(
        uri,
        'merchant' => merchant,
        'amount' => amount,
        'user_role' => 'merchant',
        source_captured_transaction_captured_amount => 'source_captured_transaction_captured_amount')
      result = JSON.parse(res.body)['data']['attributes']['allow_refund']
      
      if result == true
        client = Client.find_by(customer_email: customer_email)
        client.update(balance: client.balance + amount)
        merchant = User.find_by(id: merchant)
        merchant.update(balance: merchant.balance - amount)
        Transaction.find_by(id: transaction_id).update!(status: :approved)
      else
        Transaction.find_by(id: transaction_id).update!(status: :error)
      end
    end
  end
end
