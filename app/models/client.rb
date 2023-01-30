# frozen_string_literal: true

class Client < ApplicationRecord
  include Clients::Validations
end
