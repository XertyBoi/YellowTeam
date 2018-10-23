require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  it "expects root index to have index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "expects show method to return Zero" do
  	skip
    subject = GamesController.new.show
    expect(subject).to eq(0)
  end

  it "expects new method returns a game instance" do
    subject = GamesController.new.new
    expect(subject.class).to eq(Game)
  end

   it "expects tiles_limit method returns 99 when tile id goes above 99" do
     skip
   	subject = GamesController.new
    @game = Game.new(id: 2, name: "test_game")
    @board = Board.new(id: 1, game_id: 2)
  	expect(subject.tiles_limit).to be ( 99 )
  end

  it "expects tiles_limit method returns 0 when tile goes below 0" do
  	skip
	@tile = Tile.new(-1 , @board )
	expect(@tile.tiles_limit).to be ( 0)
  end

  it "expects tiles_limit method returns correct id of tile" do
  	skip
  	@tile = Tile.new(6 , @board )
  	expect(@tile.tiles_limit).to be ( 6 )
  end

  it "expects cookie to save" do
    skip
    get :index
    expect(response.cookies['user_id'].to_i).to be_between(10000,99999)
  end

  it "expects cookie to save in show" do
    skip
    Game.create(id: 1, name: "test_game")
    Board.create(id: 1, game_id: 1, position_id: 0)
    get :show, params: { id: 1 }
    id = response.cookies['user_id'].to_i

    expect(id).to be_between(10000,99999)
  end

  it "expects cookie to save in show" do
    skip
    Game.create(id: 1, name: "test_game")
    Board.create(id: 1, game_id: 1, position_id: 0)
    get :show, params: { id: 1 }
    id = response.cookies['user_id'].to_i

    expect().to eq()
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
