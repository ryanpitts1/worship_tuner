class SongArrangement < ActiveRecord::Base
  # Accessible attributes for the SongArrangement model.
  attr_accessible :song_id, :title, :notes, :chart_content, :chart_mapping, :original_key, :bpm, :added_by, :updated_by
  
  # Associations for the SongArrangement model.
  belongs_to :song
  has_many :song_arrangement_files, :dependent => :destroy
  
  # Validations for the SongArrangement model.
  validates :title, :chart_content, presence: true
  validates_length_of :title, maximum: 500
  validates_length_of :original_key, maximum: 2
  validates_length_of :chart_mapping, maximum: 250
  validates_length_of :chart_content, :notes, maximum: 9000
  
  # Method used for the live search on the index view.
  def self.search(search)
    if search
      where('song_arrangements.title ILIKE ? OR songs.title ILIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end
