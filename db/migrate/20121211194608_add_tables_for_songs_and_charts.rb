class AddTablesForSongsAndCharts < ActiveRecord::Migration
  def change
    create_table(:songs) do |t|
      t.string :title, null: false, default: "",  limit: 500
      t.string :artist, null: false, default: "", limit: 500
      t.string :added_by, limit: 250
      t.string :updated_by, limit: 250
      t.timestamps
    end
    
    create_table(:song_arrangements) do |t|
      t.integer :song_id, null: false, default: 0
      t.string :title, null: false, default: "",  limit: 500
      t.string :notes, limit: 9000
      t.string :chart_content, limit: 9000
      t.string :chart_mapping, limit: 250
      t.string :original_key, limit: 2
      t.integer :bpm, null: false, default: 0
      t.string :added_by, limit: 250
      t.string :updated_by, limit: 250
      t.timestamps
    end
    
    create_table(:song_arrangement_files) do |t|
      t.integer :song_id, null: false, default: 0
      t.integer :song_arrangement_id, null: false, default: 0
      t.string :title, null: false, default: "",  limit: 500
      t.string :file_path, null: false, default: "", limit: 2000
      t.string :description, null: false, default: "", limit: 9000
      t.string :added_by, limit: 250
      t.string :updated_by, limit: 250
      t.timestamps
    end

    add_index :songs, :title
    add_index :songs, :artist
    add_index :song_arrangements, :title
    add_index :song_arrangements, :original_key
    add_index :song_arrangements, :bpm
    add_index :song_arrangement_files, :title
  end
end
