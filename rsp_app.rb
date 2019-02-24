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
    redirect "/p1_asking"
  end

  get "/p1_asking" do
    erb :p1_asking
  end

  run! if app_file == $0
end
