module Transactions
  module Statuses
    extend ActiveSupport::Concern

    included do
      enum status: { pending: 0, approved: 1, captured: 2,
                     voided: 3, refunded: 4, error: 5, declined: 6 }
    end
  end
end
