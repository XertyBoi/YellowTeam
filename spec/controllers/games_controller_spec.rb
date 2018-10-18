require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  it "expects root index to have index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "expects show method to return Zero" do
    subject = GamesController.new.show
    expect(subject).to eq(0)
  end

  it "expects new method returns a game instance" do
    subject = GamesController.new.new
    expect(subject.class).to eq(Game)
  end

  # it "expects update roll to render template show " do
  #   @game = Game.create(name: "test")
  #   @board = Board.create(game_id: @game.id)
  #
  #  	get :update_roll, params: { game_id: @game.id }
  #
  #   allow(@game).to receive(:board).and_return(@board)
  #
  #   expect(response).to render_template("show")
  #
  #   @game.destroy
  #   @board.destroy
  # end


  # it "" do
  #   allow(obj).to receive(:message).with('an argument') { ... }
  #   obj.stub(:message).with('an argument') { ... }
  # end

end
