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

=begin   it "expects update roll to render template show " do
   	get :update_roll, :game_id => 1.to_s
    expect(response).to render_template("show")
  end=end

end
