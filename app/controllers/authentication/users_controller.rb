# frozen_string_literal: true

module Authentication
  class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to root_path
      else
        p @user.errors
        render :new, stats: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
  end
end
