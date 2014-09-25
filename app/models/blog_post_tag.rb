class BlogPostTag < ActiveRecord::Base
  # Accessible attributes for the Tag model.
  attr_accessible :name
  
  # Associations for the Tag model.
  has_many :blog_post_taggings, :dependent => :destroy
  has_many :blog_posts, through: :blog_post_taggings
  
  def to_s
  	name
  end
  
  # Method used for the live search on the index view.
  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end