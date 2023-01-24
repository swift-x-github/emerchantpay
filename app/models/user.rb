class User < ApplicationRecord

  include Users::Roles
  include Users::Statuses
  include Users::Validations

  def to_param
    id.to_s
  end
end
