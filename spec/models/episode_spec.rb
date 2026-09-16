require "rails_helper"

RSpec.describe Episode, type: :model do
  it "is valid with required attributes" do
    expect(build(:episode)).to be_valid
  end

  it "requires number" do
    expect(build(:episode, number: nil)).not_to be_valid
  end

  it "requires season to be a Season" do
    movie = create(:movie)
    episode = build(:episode, season: nil, season_id: movie.id)
    expect(episode).not_to be_valid
  end
end
