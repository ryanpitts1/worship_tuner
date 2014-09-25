class CreateBlogPostComments < ActiveRecord::Migration
  def change
    create_table(:blog_post_comments) do |t|
      t.integer :blog_post_id, null: false, default: 0
      t.string :name, null: false, default: "",  limit: 250
      t.string :comment, null: false, default: "", limit: 9000
      t.timestamps
    end
  end
end
