# frozen_string_literal: true

module Authentication
  class SessionsController < ApplicationController
    def new; end

    def create
      @user = User.find_by email: params[:email]
      p params[:password]
      if @user&.authenticate(params[:password])
        redirect_to root_path
      else
        redirect_to root_path, stats: :unprocessable_entity
      end
    end
  end
end
