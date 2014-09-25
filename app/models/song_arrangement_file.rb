class SongArrangementFile < ActiveRecord::Base
  # Accessible attributes for the SongArrangementFile model.
  attr_accessible :song_arrangement_id, :song_id, :title, :file_path, :url, :description, :file_path_cache, :added_by, :updated_by
  
  # Associations for the SongArrangementFile model.
  belongs_to :song
  belongs_to :song_arrangement
  
  # Mounts the file uploader to this model.
  mount_uploader :file_path, FileUploader
  
  # Validations for the SongArrangementFile model.
  validates :title, presence: true
  validates_length_of :title, maximum: 500
  validates_length_of :url, maximum: 500
  validates_length_of :description, maximum: 9000
  
  # Method used for the live search on the index view.
  def self.search(search)
    if search
      where('song_arrangement_files.title ILIKE ? OR songs_arrangements.title ILIKE ? OR songs.title ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end