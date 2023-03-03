# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authenticate_user
    return if session[:current_user_id].nil?

    respond_to do |format|
      flash[:warning] = 'You must be logged in'
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end
