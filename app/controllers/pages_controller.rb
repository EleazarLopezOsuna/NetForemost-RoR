# frozen_string_literal: true

class PagesController < ApplicationController
  def authentication; end

  def create
    @user = User.find_by email: params[:email]
    p params[:password]
    if @user&.authenticate(params[:password])
      redirect_to root_path
    else
      render :new, stats: :unprocessable_entity
    end
  end
end
