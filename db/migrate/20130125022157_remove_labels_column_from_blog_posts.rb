class RemoveLabelsColumnFromBlogPosts < ActiveRecord::Migration
  def change
  	remove_column :blog_posts, :labels
  end
end
