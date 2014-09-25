class Song < ActiveRecord::Base
  # Accessible attributes for the Song model.
  attr_accessible :title, :artist, :added_by, :updated_by
  
  # Associations for the Song model.
  has_many :song_arrangements, :dependent => :destroy
  has_many :song_arrangement_files, :through => :song_arrangements
  
  # Validations for the Song model.
  validates :title, :artist, presence: true
  validates_length_of :title, :artist, maximum: 500
  validates :title, uniqueness: { scope: :artist, message: "has already been created for this artist." }
  
  # Method used for the live search on the index view.
  def self.search(search)
    if search
      where('title ILIKE ? OR artist ILIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end
