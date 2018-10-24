require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a user" do
    @user = User.create(uuid: 1, game_id: 21, nickname: 'Nick', position_id: 0)

    expect(@user.class).to be(User)
  end
end
