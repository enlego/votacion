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
end 
