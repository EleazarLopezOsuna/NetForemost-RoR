# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_current_user
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @notes = @user.nil? ? Note.all : @user.notes
  end

  def show; end

  def new
    @note = Note.new
  end

  def edit; end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        flash[:success] = 'Note was successfully created.'
        format.html { redirect_to note_url(@note) }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        flash[:success] = 'Note was successfully updated.'
        format.html { redirect_to note_url(@note) }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      flash[:warning] = 'Note was successfully destroyed.'
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
    return if @note.user == @user

    flash[:danger] = 'You can only see your notes'
    redirect_to notes_url
  end

  def set_current_user
    if session[:current_user_id].nil?
      flash[:danger] = 'You must be logged in to see this page'
      redirect_to root_path
      return
    end

    @user = User.find(session[:current_user_id])
  end

  def note_params
    params.require(:note).permit(:body, :title, :user_id)
  end
end
