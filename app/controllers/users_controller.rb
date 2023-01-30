# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @users = User.all
  end

  def show; end

  private

  def set_user
    @transactions = Transaction.where(user_id: params[:id])
  end
end
