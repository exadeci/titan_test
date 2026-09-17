require "rails_helper"

RSpec.describe TvShow, type: :model do
  it "is valid with required attributes" do
    expect(build(:tv_show)).to be_valid
  end

  it "requires title" do
    expect(build(:tv_show, title: nil)).not_to be_valid
  end
end
