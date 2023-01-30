# frozen_string_literal: true

module Scenarios
  class NotesService
    def send_notification(transaction_id, amount, result)
      Note.create(transaction_id: transaction_id,
                  amount: amount,
                  notification_url: notification_url.to_s,
                  description: "transaction id #{transaction_id} 
                                status #{result == true ? 'approved' : 'declined'}  ")
    end
  end
end
