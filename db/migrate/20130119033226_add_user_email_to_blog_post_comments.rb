class AddUserEmailToBlogPostComments < ActiveRecord::Migration
  def change
  	add_column :blog_post_comments, :email, :string, after: :name, null: false, default: "", limit: 250
  end
end
