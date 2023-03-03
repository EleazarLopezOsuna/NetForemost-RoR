# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_current_user
  before_action :set_sort_direction, only: %i[sort]
  before_action :set_note, only: %i[edit update destroy]

  def index
    @notes = Note.all and return if @user.nil?

    if @user.config['field'] == 'hashtag'
      @notes = Note.order_by_first_hashtag @user.id, @user.config['direction']
      return
    end
    @notes = Note.get_by_user_ordered_by_field @user.id, @user.config['field'], @user.config['direction']
  end

  def sort
    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { render :index, status: :ok, location: @note }
    end
  end

  def new
    @note = Note.new
  end

  def edit; end

  def create
    @note = Note.new(note_params.except(:hashtags))
    @note.user = @user
    @note.hashtag_ids = set_hashtag_id_list

    respond_to do |format|
      if @note.save
        flash[:success] = 'Note was successfully created.'
        format.html { redirect_to notes_url }
        format.json { render :index, status: :created, location: @note }
      else
        p @note.errors
        flash[:danger] = 'Note could not be created.'
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params.except(:hashtags))
        @note.hashtag_ids = set_hashtag_id_list
        @note.save
        flash[:success] = 'Note was successfully updated.'
        format.html { redirect_to notes_url }
        format.json { render :index, status: :ok, location: @note }
      else
        flash[:danger] = 'Note could not be updated.'
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

  def set_hashtag_id_list
    note_params[:hashtags].split(',').map do |hashtag|
      hashtag_record = Hashtag.find_by name: hashtag.strip.gsub(' ', '_')
      next hashtag_record.id unless hashtag_record.nil?

      new_hashtag = Hashtag.new name: hashtag.strip.gsub(' ', '_')
      new_hashtag.save
      new_hashtag.id
    end
  end

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

  def set_sort_direction
    if @user.config['field'] == params[:field]
      @user.config['direction'] = @user.config['direction'] == 'asc' ? 'desc' : 'asc'
    else
      @user.config['field'] = params[:field]
      @user.config['direction'] = 'asc'
    end
    @user.save
  end

  def note_params
    params.require(:note).permit(:body, :title, :user_id, :hashtags)
  end
end
