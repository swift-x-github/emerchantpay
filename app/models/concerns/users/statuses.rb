# frozen_string_literal: true

module Users
  module Statuses
    extend ActiveSupport::Concern

    included do
      scope :connected, -> { where(status: %i[active inactive]) }
      scope :active, -> { where(status: :active) }
      scope :inactive, -> { where(status: :inactive) }

      enum status: { active: 0, inactive: 1 }
    end
  end
end
