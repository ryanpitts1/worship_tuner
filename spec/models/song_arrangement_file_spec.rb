require 'spec_helper'

describe SongArrangementFile do
  before { @song_arrangement_file = SongArrangementFile.new(song_arrangement_id: 1, song_id: 1, title: "Song Title", file_path: "testfile.jpg", url: "http://www.google.com", description: "Test Description", file_path_cache: "tmp/testfile.jpg", added_by: "exampleuser@exmple.com", updated_by: "exampleuser@exmple.com") }
  subject { @song_arrangement_file }
  
  it { should respond_to(:song_arrangement_id) }
  it { should respond_to(:song_id) }
  it { should respond_to(:title) }
  it { should respond_to(:file_path) }
  it { should respond_to(:url) }
  it { should respond_to(:description) }
  it { should respond_to(:file_path_cache) }
  it { should respond_to(:added_by) }
  it { should respond_to(:updated_by) }
end