defmodule Voter do
  alias Voter.GameServer

  def new_game(params) do
    GameServer.start(params)
  end

  def add_player(game, name) do
    GameServer.add_player(game, name)
  end

  def add_vote(game, _email, player_name) do
    GameServer.add_vote(game, player_name)
  end

  def activate(game) do
    GameServer.activate()
  end

  def close(game) do
    GameServer.close()
  end
  
  def view_game(game), do: GameServer.view_game(game)
#  def select_vote_from(email) do
#    Game.select_vote_from(email)
#  end

#  def select_winner(game) do
#    Game.select_winner(game)
#  end
end
