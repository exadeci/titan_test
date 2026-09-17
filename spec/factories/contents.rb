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
end
