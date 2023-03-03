# frozen_string_literal: true

module Authentication
  class SessionsController < ApplicationController
    def new; end

    def logout
      session[:current_user_id] = nil
      flash[:success] = 'Logged out'
      redirect_to root_path
    end

    def create
      @user = User.find_by email: params[:email]
      if @user&.authenticate(params[:password])
        session[:current_user_id] = @user.id
        redirect_to notes_path
      else
        flash[:danger] = 'Wrong Credentials'
        redirect_to root_path, stats: :unprocessable_entity
      end
    end
  end
end
