require "sinatra/base"
require_relative "./lib/game.rb"
require_relative "./lib/player.rb"
require_relative "./lib/randomMovement.rb"

class Playing < Sinatra::Base
  enable :sessions

  get "/" do
    erb :index
  end

  post "/movement" do
    Game.player_1_name.unshift(params[:name])
    redirect "/ask_movement"
  end

  get "/ask_movement" do
    erb :ask_movement
  end

  post '/showResult' do
    Game.player_1_movement.unshift(params[:movement])
    @player_1 = Player.new(Game.player_1_name[0], Game.player_1_movement[0])
    @server_player = Player.new("computer",
      RandomMovement.new().random_movement)
    @game = Game.new(@player_1, @server_player)
    @message = @game.winner_term
    erb :result
  end

  run! if app_file == $0
end
