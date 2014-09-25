class CreateTaggingsAndTagsTables < ActiveRecord::Migration
  def change
    create_table(:blog_post_taggings) do |t|
      t.integer :blog_post_id, null: false, default: 0
      t.integer :blog_post_tag_id, null: false, default: 0
      t.timestamps
    end
    
    create_table(:blog_post_tags) do |t|
      t.string :name, null: false, default: "",  limit: 250
      t.timestamps
    end
  end
end
