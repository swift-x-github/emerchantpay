class Merchant < User
  default_scope { where(role: :merchant) }
end
