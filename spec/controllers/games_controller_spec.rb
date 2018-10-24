require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  before :each do
    @subject = GamesController.new
    @game = Game.new(id: 2, name: "test_game", log: "test£test2")
    @board = Board.new(id: 1, game_id: 2)
  end

  it "expects root index to have index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "expects new method returns a game instance" do
    expect(@subject.new.class).to eq(Game)
  end

   it "expects tiles_limit method returns 100 when player's pos id goes above 100" do
    @user = User.new(uuid: 10000, game_id: @game.id, nickname: "test", position_id: 101)
  	expect(@subject.tiles_limit(@user, 1)).to_not eq( 101 )
  end

  it "expects tiles_limit methodto push back from 100" do
   @user = User.new(uuid: 10000, game_id: @game.id, nickname: "test", position_id: 99)
   expect(@subject.tiles_limit(@user, 9)).to eq( 92 )
   # 99 + 1 = 100
   # 100 - (n-1) = 92
 end

  it "expects tiles_limit method returns 1 when tile goes below 1" do
    subject = GamesController.new
    @user = User.new(uuid: 10000, game_id: @game.id, nickname: "test", position_id: 1)
    expect(@subject.tiles_limit(@user, -1)).to eq( 1 )
  end

  it "expects tile.id to return correct id of tile" do
  	@tile = Tile.new(6 , @board, 0 )
  	expect(@tile.id).to be ( 6 )
  end

  it "expects cookie to save" do
    get :index
    expect(response.cookies['user_id'].to_i).to be_between(10000,99999)
  end

  it "expects cookie to save in show" do
    @user = User.new(uuid: 10000, game_id: @game.id, nickname: "test", position_id: 99)

    get :show, params: { id: 1 }
    id = response.cookies['user_id'].to_i

    expect(id).to be_between(10000,99999)
  end

  it "expects cookie to save in user's UUID" do
    get :index
    @user = User.new(uuid: response.cookies['user_id'], game_id: @game.id, nickname: "test", position_id: 99)
    get :show, params: { id: 1 }
    id = response.cookies['user_id'].to_i

    expect(@user.uuid).to be_between(10000,99999)
  end

  it "expects update roll to render template show " do
    skip
    @game = Game.create(id: 2, name: "test_game",turn_id: 0, log: "test£test2")
    @tile1 = Tiles.create(id: 1, tile_type: "none", link_id: 2)
    @tile2 = Tiles.create(id: 2, tile_type: "none", link_id: 0)
    @board = Board.create(id: 1, game_id: 2, tile_set: "default")

    @game.save
    @board.save
    @tile1.save
    @tile2.save

    allow(@game).to receive(:board).and_return(@board)

    get :index
    @user = User.new(uuid: response.cookies['user_id'], game_id: @game.id, nickname: "test", position_id: 2)
    get :show, params: { id: 2 }
    @current_player = @user

   	#ßpost :update_roll, params: { game_id: 2 }
    puts @user.nickname
    puts @board.get_tile_set.first.link


    expect(response).to render_template("show")

    @game.destroy
    @board.destroy
    @tile1.destroy
    @tile2.destroy
  end

end
