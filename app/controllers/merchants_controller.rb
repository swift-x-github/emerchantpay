# frozen_string_literal: true

class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[show]

  def index
    @merchants = Merchant.all
  end

  def show; end

  private

  def set_merchant
    @transactions = Transaction.where(user_id: params[:id])
  end
end
