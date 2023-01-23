class User < ApplicationRecord

  include Users::Roles
  include Users::Statuses
end
