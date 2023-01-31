# frozen_string_literal: true

module Transactions
  class Capture < ApplicationJob
    queue_as :system_high

    def perform(transaction_id, amount, notification_url, customer_email, merchant)
      uri = URI(notification_url)
      res = Net::HTTP.post_form(uri, 'customer_email' => customer_email, 
                                'amount' => amount, 'user_role' => 'customer')
      result = JSON.parse(res.body)['data']['attributes']['allow_capture']

      if result == true
        client = Client.find_by(customer_email: customer_email)
        client.update(balance: client.balance - amount,
                      captured_amount: client.captured_amount - amount)
        merchant = Merchant.find_by(id: merchant)
        merchant.update(balance: merchant.balance + amount)
        Transaction.find_by(id: transaction_id).update!(status: :approved)
      else
        Transaction.find_by(id: transaction_id).update!(status: :error)
      end
    end
  end
end
