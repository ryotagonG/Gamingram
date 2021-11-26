class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end
  
  def create
    @game =Game.new(game_params)
    @game.user_id = current_user.id
    @game.save
    redirect_to game_path(@game)
  end

  def edit
  end
  
  private
  def game_params
    params.require(:game).permit(:title, :body, :image)
  end
  
end
