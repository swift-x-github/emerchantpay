module Transactions
  module Validations
    extend ActiveSupport::Concern

    included do
      validates_numericality_of :amount, :greater_than => 0.0, allow_blank: true

      validates :status, inclusion: { in: %w[pending approved captured voided refunded error declined] }

      validates :customer_email, presence: true,
                          length: {
                             maximum: BaseValidator::EMAIL_LENGTH_LIMIT_MAX,
                             minimum: BaseValidator::EMAIL_LENGTH_LIMIT_MIN,
                             allow_blank: true
                          },
                          format: { with: ApplicationRecord::EMAIL_FORMAT, allow_blank: true },
                          uniqueness: false

      validates :customer_phone, presence: true

      validate :validate_transaction_id, if: -> { transaction_id.present? }

      private

      def validate_transaction_id
        return if transaction_id.to_s.match?(ApplicationRecord::UUID_FORMAT)

        errors.add(:transaction_id, 'UUID must be correct')
      end
    end
  end
end
