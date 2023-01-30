# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  require 'uri'
  require 'net/http'
end
