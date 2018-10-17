require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  it "expects root index to have index template" do
    get :index
    expect(response).to render_template("index")
  end
end
