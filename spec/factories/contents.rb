FactoryBot.define do
  factory :movie, class: "Movie" do
    sequence(:title) { |n| "Movie #{n}" }
    sequence(:original_title) { |n| "Original Movie #{n}" }
    year { 1999 }
  end

  factory :tv_show, class: "TvShow" do
    sequence(:title) { |n| "TV Show #{n}" }
    sequence(:original_title) { |n| "Original TV Show #{n}" }
    year { 2010 }
  end

  factory :season, class: "Season" do
    association :tv_show
    sequence(:title) { |n| "Season #{n}" }
    sequence(:original_title) { |n| "Original Season #{n}" }
    year { 2011 }
    sequence(:number)
  end

  factory :episode, class: "Episode" do
    association :season
    sequence(:title) { |n| "Episode #{n}" }
    sequence(:original_title) { |n| "Original Episode #{n}" }
    year { 2012 }
    sequence(:number)
  end
end
