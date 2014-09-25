class BlogPostTagging < ActiveRecord::Base
  # Accessible attributes for the Tagging model.
  attr_accessible :blog_post_id, :blog_post_tag_id

  # Associations for the Tagging model.
  belongs_to :blog_post
  belongs_to :blog_post_tag
end