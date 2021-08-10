defmodule Voter do
  alias Voter.Core.Game, as: Game
  alias Voter.Core.Player, as: Player
  alias Voter.Core.Vote, as: Vote

  def new_game() do
    Game.new(1)
  end

  def end_game(game) do
    Game.finish(game)
  end 

  def add_player(name, game) do
    Player.new(name)
    |> Game.add_player(game)
  end

  def add_vote(game, email, player, id) do
    Vote.new(id, email, player)
    |> Game.add_vote(game)
  end
end 
