class SongArrangementsController < ApplicationController
  # Verifies that the user is singed in.
  before_filter :authenticate_user!, except: :show
  before_filter :authenticate_user_is_admin, only: :destroy
  
  # Gets a list of all song arrangement files.
  def index
    @song_arrangements = SongArrangement.search(params[:search]).paginate(page: params[:page], per_page: 20, joins: :song, order: "song_arrangements.title ASC, songs.title ASC, song_arrangements.original_key ASC, song_arrangements.bpm ASC, song_arrangements.id ASC")
  end

  # Gets a speific song arrangement file.
  def show
    @song_arrangement = SongArrangement.find(params[:id], joins: :song)
    @song_arrangement_files = SongArrangementFile.find(:all, conditions: ["song_arrangement_id = ?", params[:id]], order: "title ASC, id ASC")
  end

  # Builds a new song arrangement file object.
  def new
    @song_arrangement = SongArrangement.new
    @song = Song.find(params[:song_id])
  end

  # Saves the song arrangement file object to the database.
  def create
    @song_arrangement = SongArrangement.new(params[:song_arrangement])
    @song = Song.find(params[:song_arrangement][:song_id])
    if @song_arrangement.save
      flash[:success] = "\"#{@song_arrangement.title}\" arrangement has been added to #{@song.title}."
      redirect_to edit_song_path(params[:song_arrangement][:song_id])
    else
      render 'new'
    end
  end

  # Gets the song arrangement file that has been requested for editing.
  def edit
    @song_arrangement = SongArrangement.find(params[:id], joins: :song)
    @song_arrangement_files = SongArrangementFile.paginate(page: params[:page], per_page: 10, conditions: ["song_arrangement_id = ?", params[:id]], order: "title ASC, id ASC")
  end

  # Saves the updated song arrangement file object to the database.
  def update
    @song_arrangement = SongArrangement.find(params[:id])
    if @song_arrangement.update_attributes(params[:song_arrangement])
      flash[:success] = "\"#{@song_arrangement.title}\" arrangement has been updated."
      redirect_to :back
    else
      render 'edit'
    end
  end

  # Deletes the specified song arrangement file from the database.
  def destroy
    @song_arrangement = SongArrangement.find(params[:id])
    @song_arrangement.destroy
    flash[:success] = "\"#{@song_arrangement.title}\" arrangement has been deleted."
    redirect_to :back
  end
  
  private

    def authenticate_user_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.try(:admin?))
    end
end
