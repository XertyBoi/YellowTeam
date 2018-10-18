require 'rails_helper'

RSpec.describe Game, type: :model do
  it "expects new game not to be null" do
    game = Game.new(id: 2, name: "test_game")
    expect(game.class).to eq( Game)
  end
end
