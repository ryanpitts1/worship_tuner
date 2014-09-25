class AddUrlToSongArrangementFiles < ActiveRecord::Migration
  def change
    add_column :song_arrangement_files, :url, :string, limit: 500, default: "", after: :file_path
  end
end
