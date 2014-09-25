class BlogPostComment < ActiveRecord::Base
  # Accessible attributes for the Song model.
  attr_accessible :blog_post_id, :name, :email, :comment
  
  # Associations for the Song model.
  belongs_to :blog_post
  
  # Validations for the Song model.
  validates :blog_post_id, :name, :comment, presence: true
  validates_length_of :name, maximum: 250
  validates_length_of :email, maximum: 250
  validates_length_of :comment, maximum: 9000
  
  # Method used for the live search on the index view.
  def self.search(search)
    if search
      where('name ILIKE ? OR comment ILIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end
