FactoryBot.define do
  factory :movie, class: "Movie" do
    sequence(:title) { |n| "Movie #{n}" }
    sequence(:original_title) { |n| "Original Movie #{n}" }
    year { 1999 }
  end
end
