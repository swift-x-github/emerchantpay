# frozen_string_literal: true

class AdminsController < ApplicationController
  before_action :admin_merchant, only: %i[show]

  def index
    @admins = Admin.all
  end

  def show; end

  private

  def admin_merchant
    @transactions = Transaction.where(user_id: params[:id])
  end
end
