# frozen_string_literal: true

class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
end
