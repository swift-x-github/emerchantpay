# frozen_string_literal: true

module Users
  module Roles
    extend ActiveSupport::Concern

    included do
      enum role: { admin: 0, merchant: 1 }

      scope :merchants, -> { where(role: %i[merchant]) }
      scope :admins, -> { where(role: %i[admin]) }
    end
  end
end
