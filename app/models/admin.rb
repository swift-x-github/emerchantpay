# frozen_string_literal: true

class Admin < User
  default_scope { where(role: :admin) }
end
