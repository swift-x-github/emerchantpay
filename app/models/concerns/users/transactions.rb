module Users
  module Transactions
    extend ActiveSupport::Concern
  
    included do
      has_many :transactions
    end
  end
end
  