class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :content

  validates :position, presence: true
end
