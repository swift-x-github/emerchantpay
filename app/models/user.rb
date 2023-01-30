# frozen_string_literal: true

class User < ApplicationRecord
  include Users::Roles
  include Users::Statuses
  include Users::Validations
  include Users::Transactions

  def to_param
    id.to_s
  end
end
