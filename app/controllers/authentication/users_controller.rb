# frozen_string_literal: true

module Authentication
  class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.config = {
        field: 'id',
        direction: 'asc'
      }
      if @user.save
        redirect_to root_path
      else
        render :new, stats: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
  end
end
