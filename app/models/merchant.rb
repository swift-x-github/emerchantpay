# frozen_string_literal: true

class Merchant < User
  default_scope { where(role: :merchant) }
end
