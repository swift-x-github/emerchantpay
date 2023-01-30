# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  EMAIL_FORMAT = %r{
    \A[\p{L}0-9!#$%&'*+/=?^_‘{|}~-]+(?:\.[\p{L}0-9!#$%&'*+/=?^_‘{|}~-]+)*@
    (?:[\p{L}0-9](?:[\p{L}0-9-]*[\p{L}0-9])?\.)+[\p{L}0-9](?:[\p{L}0-9-]*[\p{L}0-9])?\z
  }ix.freeze
  USERNAME_FORMAT = /\A[\w\-]+\z/i.freeze
  UUID_FORMAT = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/.freeze
  self.abstract_class = true
end
