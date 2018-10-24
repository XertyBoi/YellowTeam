require 'rails_helper'

RSpec.describe Game, type: :model do
  it "creates a game" do
    @game = Game.create(name: 'Test game', turn_id: 0, log: 'log')
    expect(@game.class).to be(Game)
  end
end
