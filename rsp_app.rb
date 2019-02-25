require "sinatra/base"
require_relative "./lib/game.rb"
require_relative "./lib/player.rb"
require_relative "./lib/randomMovement.rb"

class Playing < Sinatra::Base
  enable :sessions

  get "/" do
    erb :index
  end

  post "/p1_movement" do
    session[:player_1_name]= params[:player_1_name]
    session[:player_2_name]= params[:player_2_name]
    redirect "/starting_game"
  end

  get "/starting_game" do
    erb :starting_game
  end

  post "/p1_asking" do
    erb :p1_asking
  end

  post "/p2_asking" do
    session[:player_1_movement]=params[:player_1_movement]
    erb :p2_asking
  end

  post "/result" do
    session[:player_2_movement] = params[:player_2_movement]
    player_1 = Player.new(session[:player_1_name],session[:player_1_movement])
    player_2 = Player.new(session[:player_2_name],session[:player_2_movement])
    game = Game.new(player_1,player_2)
    @winner_term = game.winner_term()

    erb :result

  end

  run! if app_file == $0
end
