class ClientsController < ApplicationController

  #before_action :set_merchant, only: %i[ show ]

  def index
    @clients = Client.all
  end

  # def show
  # end

  # private

  # def set_merchant
  #   @transactions = Transaction.where(user_id: params[:id])
  # end 
end