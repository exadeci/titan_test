require "rails_helper"

RSpec.describe Movie, type: :model do
  it "is valid with required attributes" do
    expect(build(:movie)).to be_valid
  end

  it "requires title" do
    expect(build(:movie, title: nil)).not_to be_valid
  end

  it "requires original_title" do
    expect(build(:movie, original_title: nil)).not_to be_valid
  end

  it "requires year" do
    expect(build(:movie, year: nil)).not_to be_valid
  end
end
