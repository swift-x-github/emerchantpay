# frozen_string_literal: true

module Api
  class ClientsController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def show
      case params[:user_role] 
      when "customer"
        @client = Client.find_by(customer_email: params[:customer_email])
        if @client.nil?
          render json: { errors: 404 }
        else
          render json: ClientSerializer.new(@client, { params: { amount: params[:amount] } }).serialized_json
        end
      when "merchant"
        @merchant = User.find_by(id: params[:merchant])
        if @merchant.nil?
          render json: { errors: 404 }
        else
          render json: MerchantSerializer.new(@merchant, { params: { 
            amount: params[:amount],
            source_captured_transaction_captured_amount: params[:source_captured_transaction_captured_amount]  } })
            .serialized_json
        end
      end 
    end

    def client_params
      params.require(:client).require(:amount, :customer_email, :user_role, :merchant)
    end
  end
end
