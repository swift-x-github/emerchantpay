module Users
  module Roles
    extend ActiveSupport::Concern
  
    included do
      enum role: { admin: 0, merchant: 1 }
    end
  end
end
