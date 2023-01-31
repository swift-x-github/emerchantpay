# frozen_string_literal: true

class Authorize < Transaction
    default_scope { where(type: "Authorize") }
end
