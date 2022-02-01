defmodule Voter do
  alias Voter.GameServer

  def new_game() do
    GameServer.start()
  end

  def add_player(game, name) do
    game.add_player(name)
  end

  def add_vote(game, _email, player_name) do
    game.add_vote(game, player_name)
  end

  def activate(game) do
    game.activate()
  end

  def close(game) do
    game.close()
  end

#  def select_vote_from(email) do
#    Game.select_vote_from(email)
#  end

#  def select_winner(game) do
#    Game.select_winner(game)
#  end
end
