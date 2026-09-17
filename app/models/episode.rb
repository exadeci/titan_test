class Episode < Content
  belongs_to :season, class_name: "Season"
  validates :number, presence: true
  validate :season_must_be_season

  private

  def season_must_be_season
    return if season.is_a?(Season)

    errors.add(:season, "must be a season")
  end
end
