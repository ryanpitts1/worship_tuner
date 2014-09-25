require 'spec_helper'

describe SongArrangement do
  before { @song_arrangement = SongArrangement.new(song_id: 1, title: "Song Title", notes: "Test notes.", chart_content: "Test chart content.", chart_mapping: "V1, C, V2, C, B, C, C", original_key: "A", bpm: 70, added_by: "exampleuser@exmple.com", updated_by: "exampleuser@exmple.com") }
  subject { @song_arrangement }
  
  it { should respond_to(:song_id) }
  it { should respond_to(:title) }
  it { should respond_to(:notes) }
  it { should respond_to(:chart_content) }
  it { should respond_to(:chart_mapping) }
  it { should respond_to(:original_key) }
  it { should respond_to(:bpm) }
  it { should respond_to(:added_by) }
  it { should respond_to(:updated_by) }
end