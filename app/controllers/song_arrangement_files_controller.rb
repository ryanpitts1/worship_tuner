class SongArrangementFilesController < ApplicationController
  # Verifies that the user is singed in.
  before_filter :authenticate_user!, except: :show
  before_filter :authenticate_user_is_admin, only: :destroy
  
  # Gets a list of all song arrangements.
  def index
    @song_arrangement_files = SongArrangementFile.search(params[:search]).paginate(page: params[:page], per_page: 20, joins: [:song, :song_arrangement], order: "song_arrangement_files.title ASC, songs.title ASC, song_arrangements.title ASC, song_arrangement_files.id ASC")
  end
  
  # Gets a speific song arrangement.
  def show
    @song_arrangement_file = SongArrangementFile.find(params[:id], joins: [:song, :song_arrangement])
  end

  # Builds a new song arrangement object.
  def new
    @song_arrangement_file = SongArrangementFile.new
    @song = Song.find(params[:song_id])
    @song_arrangement = SongArrangement.find(params[:song_arrangement_id])
  end

  # Saves the song arrangement object to the database.
  def create
    @song_arrangement_file = SongArrangementFile.new(params[:song_arrangement_file])
    @song = Song.find(params[:song_arrangement_file][:song_id])
    @song_arrangement = SongArrangement.find(params[:song_arrangement_file][:song_arrangement_id])
    if @song_arrangement_file.save
      flash[:success] = "\"#{@song_arrangement_file.title}\" attachment has been added to #{@song_arrangement.title}."
      redirect_to edit_song_arrangement_path(params[:song_arrangement_file][:song_arrangement_id])
    else
      render 'new'
    end
  end

  # Gets the song arrangement that has been requested for editing.
  def edit
    @song_arrangement_file = SongArrangementFile.find(params[:id], joins: [:song, :song_arrangement])
  end

  # Saves the updated song arrangement object to the database.
  def update
    @song_arrangement_file = SongArrangementFile.find(params[:id])
    if @song_arrangement_file.update_attributes(params[:song_arrangement_file])
      flash[:success] = "\"#{@song_arrangement_file.title}\" attachment has been updated."
      redirect_to :back
    else
      render 'edit'
    end
  end

  # Deletes the specified song arrangement from the database.
  def destroy
    @song_arrangement_file = SongArrangementFile.find(params[:id])
    @song_arrangement_file.destroy
    flash[:success] = "\"#{@song_arrangement_file.title}\" attachment has been deleted."
    redirect_to :back
  end
  
  private

    def authenticate_user_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.try(:admin?))
    end
end
