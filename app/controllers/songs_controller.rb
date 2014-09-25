class SongsController < ApplicationController
  # Verifies that the user is singed in.
  before_filter :authenticate_user!, except: [ :index, :show ]
  before_filter :authenticate_user_is_admin, only: :destroy
  
  # Gets a list of all song arrangement files.
  def index
     @songs = Song.search(params[:search]).paginate(page: params[:page], per_page: 20, order: "title ASC, artist ASC")
  end

  # Gets a speific song.
  def show
    @song = Song.find(params[:id])
    @song_arrangements = SongArrangement.paginate(page: params[:page], per_page: 5, joins: "LEFT JOIN song_arrangement_files ON song_arrangement_files.song_id = song_arrangements.song_id", conditions: ["song_arrangements.song_id = ?", params[:id]], group: "song_arrangements.id", order: "song_arrangements.title ASC, song_arrangements.original_key ASC, song_arrangements.bpm ASC, song_arrangements.id ASC")
  end

  # Builds a new song object.
  def new
    @song = Song.new
  end

  # Saves the song object to the database.
  def create
    @song = Song.new(params[:song])
    if @song.save
      flash[:success] = "\"#{@song.title}\" song has been added to the song library."
      redirect_to edit_song_path(@song)
    else
      render 'new'
    end
  end

  # Gets the song that has been requested for editing.
  def edit
    @song = Song.find(params[:id])
    @song_arrangements = SongArrangement.paginate(page: params[:page], per_page: 10, conditions: ["song_id = ?", params[:id]], order: "title ASC, original_key ASC, bpm ASC, id ASC")
  end

  # Saves the updated song object to the database.
  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      flash[:success] = "\"#{@song.title}\" song has been updated."
      redirect_to :back
    else
      render 'edit'
    end
  end

  # Deletes the specified song from the database.
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:success] = "\"#{@song.title}\" song has been deleted."
    redirect_to songs_path
  end
  
  private

    def authenticate_user_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.try(:admin?))
    end
end
