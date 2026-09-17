class Season < Content
  belongs_to :tv_show, class_name: "TvShow"
  validates :number, presence: true
  validate :tv_show_must_be_tv_show

  private

  def tv_show_must_be_tv_show
    return if tv_show.is_a?(TvShow)

    errors.add(:tv_show, "must be a TV show")
  end
end
