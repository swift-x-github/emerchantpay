# frozen_string_literal: true

module Api
  class ClientsController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def show
      @client = Client.find_by(customer_email: params[:customer_email])

      if @client.nil?
        render json: { errors: 404 }
      else
        render json: ClientSerializer.new(@client, { params: { amount: params[:amount] } }).serialized_json
      end
    end

    def client_params
      params.require(:client).require(:amount, :customer_email)
    end
  end
end
