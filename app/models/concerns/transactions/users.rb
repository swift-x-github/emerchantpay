module Transactions
  module Users
    extend ActiveSupport::Concern

    included do
      belongs_to :user
    end
  end
end
  