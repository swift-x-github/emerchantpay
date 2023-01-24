# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  #primary_abstract_class
  EMAIL_FORMAT = %r{
    \A[\p{L}0-9!#$%&'*+/=?^_‘{|}~-]+(?:\.[\p{L}0-9!#$%&'*+/=?^_‘{|}~-]+)*@
    (?:[\p{L}0-9](?:[\p{L}0-9-]*[\p{L}0-9])?\.)+[\p{L}0-9](?:[\p{L}0-9-]*[\p{L}0-9])?\z
  }ix.freeze
  USERNAME_FORMAT = /\A[\w\-]+\z/i.freeze
  self.abstract_class = true
end
