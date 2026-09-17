require "rails_helper"

RSpec.describe Season, type: :model do
  it "is valid with required attributes" do
    expect(build(:season)).to be_valid
  end

  it "requires number" do
    expect(build(:season, number: nil)).not_to be_valid
  end

  it "requires tv_show to be a TvShow" do
    movie = create(:movie)
    season = build(:season, tv_show: nil, tv_show_id: movie.id)
    expect(season).not_to be_valid
  end
end
