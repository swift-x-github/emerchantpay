class Transaction < ApplicationRecord
  
  include Transactions::Users
  include Transactions::Statuses
  include Transactions::Validations

end

