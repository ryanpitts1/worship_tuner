require 'spec_helper'

describe Song do
  before { @song = Song.new(title: "Song Title", artist: "Test Artist", added_by: "exampleuser@exmple.com", updated_by: "exampleuser@exmple.com") }
  subject { @song }
  
  it { should respond_to(:title) }
  it { should respond_to(:artist) }
  it { should respond_to(:added_by) }
  it { should respond_to(:updated_by) }
end