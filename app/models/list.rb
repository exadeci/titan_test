class List < ApplicationRecord
  has_many :list_items, -> { order(:position) }

  validates :name, presence: true
end
