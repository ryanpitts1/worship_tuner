class BlogPost < ActiveRecord::Base
  # Accessible attributes for the BlogPost model.
  attr_accessible :title, :author, :body, :tag_list, :status
  
  # Associations for the BlogPost model.
  has_many :blog_post_comments, :dependent => :destroy
  has_many :blog_post_taggings, :dependent => :destroy
  has_many :blog_post_tags, through: :blog_post_taggings
  
  # Validations for the BlogPost model.
  validates :title, :author, :body, presence: true
  validates_length_of :title, maximum: 500
  validates_length_of :author, maximum: 250
  validates_length_of :body, maximum: 9000
  
  def self.tag_counts
  	BlogPostTag.select("blog_post_tags.*, COUNT(blog_post_taggings.blog_post_tag_id) AS count").joins(:blog_post_taggings).group("blog_post_taggings.blog_post_tag_id,blog_post_tags.id")
  end
  
  # Builds tag list for a given blog post
  def tag_list
  	return self.blog_post_tags.join(", ")
  end
  
  # Creates the tag_list virtual attribute
  def tag_list=(tags_string)
  	self.blog_post_taggings.destroy_all
  	
  	tag_names = tags_string.split(",").collect{ |s| s.strip }.uniq
  	
  	tag_names.each do |tag_name|
  	  blog_post_tag = BlogPostTag.find_or_create_by_name(tag_name)
  	  blog_post_tagging = self.blog_post_taggings.new
  	  blog_post_tagging.blog_post_tag_id = blog_post_tag.id
  	end
  end

  # Method used for the live search on the index view.
  def self.search(search)
    if search
      where('title ILIKE ? OR body ILIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end
