module Users
  module Validations
    extend ActiveSupport::Concern

    included do
      before_validation :normalize_email
      validates :name, presence: true,
                          length: {
                            maximum: BaseValidator::NAME_MAX_LEN,
                            minimum: BaseValidator::NAME_MIN_LEN,
                            allow_blank: true
                          },
                          uniqueness: false

      validates :email, presence: true,
                          length: {
                             maximum: BaseValidator::EMAIL_LENGTH_LIMIT_MAX,
                             minimum: BaseValidator::EMAIL_LENGTH_LIMIT_MIN,
                             allow_blank: true
                          },
                          format: { with: ApplicationRecord::EMAIL_FORMAT, allow_blank: true },
                          uniqueness: true
      
      validates :status, inclusion: { in: %w[active inactive] }
      
      validates :role, inclusion: { in: %w[admin merchant] }

      private

      def normalize_email
        self.email = email.to_s.strip.downcase
      end
    end
  end
end
