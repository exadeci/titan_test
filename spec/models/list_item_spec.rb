require "rails_helper"

RSpec.describe ListItem, type: :model do
  it "is valid with required attributes" do
    expect(build(:list_item)).to be_valid
  end

  it "rejects duplicate position in the same list" do
    list = create(:list)
    create(:list_item, list: list, position: 1)
    duplicate = build(:list_item, list: list, position: 1, content: create(:tv_show))

    expect { duplicate.save!(validate: false) }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
