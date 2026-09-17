class Content < ApplicationRecord
  validates :title, :original_title, :year, presence: true

  def content_type
    model_name.element
  end

  def to_api
    attrs = {
      id: id,
      content_type: content_type,
      title: title,
      original_title: original_title,
      year: year
    }
    attrs[:number] = number if number.present?
    attrs[:tv_show_id] = tv_show_id if tv_show_id.present?
    attrs[:season_id] = season_id if season_id.present?
    attrs
  end
end
