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
end
