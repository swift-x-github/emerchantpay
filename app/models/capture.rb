# frozen_string_literal: true

class Capture < Transaction
  default_scope { where(type: "Capture") }
end
