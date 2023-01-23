module Users
  module Statuses
    extend ActiveSupport::Concern
  
    included do
      enum status: { active: 0, inactive: 1 }
    end
  end
end
