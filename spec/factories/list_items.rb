FactoryBot.define do
  factory :list_item do
    list
    content factory: :movie
    sequence(:position)
  end
end
