FactoryGirl.define do
  factory :song do |s|
    s.sequence(:title) { |n| "Song Title #{n}" }
    s.sequence(:artist) { |n| "Song Artist #{n}" }
    
    factory :song_with_song_arrangements do
      ignore do
        song_arrangements_count 100
      end
      
      after(:create) do |song, evaluator|
        FactoryGirl.create_list(:song_arrangement, evaluator.song_arrangements_count, song: song)
      end
    end
  end
  
  factory :song_arrangement do |sa|
    song
    
    sa.sequence(:title) { |n| "Arrangement #{n}" }
    original_key 'A'
    bpm 75
    sa.sequence(:chart_content) { |n| "This is the chart content for Arrangement #{n}." }
    chart_mapping 'V1, C, V2, C, B, C, C'
    sa.sequence(:notes) { |n| "These are notes for the Arrangement #{n}." }
    
    factory :song_arrangement_with_song_arrangement_files do
      ignore do
        song_arrangement_files_count 100
      end
      
      after(:create) do |song_arrangement, evaluator|
        FactoryGirl.create_list(:song_arrangement_file, evaluator.song_arrangement_files_count, song_arrangement: song_arrangement)
      end
    end
  end
  
  factory :song_arrangement_file do |saf|
    song_arrangement
    song
    
    saf.sequence(:title) { |n| "Attachment #{n}" }
    url 'http://www.google.com'
    saf.sequence(:description) { |n| "This is the description of Attachment #{n}." }
  end
end