class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table(:blog_posts) do |t|
      t.string :title, null: false, default: "",  limit: 500
      t.string :author, null: false, default: "", limit: 250
      t.string :body, null: false, default: "", limit: 9000
      t.string :labels, null: false, default: "", limit: 2000
      t.integer :status, null: false, default: 1
      t.timestamps
    end
  end
end
