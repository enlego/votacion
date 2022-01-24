defmodule Voter do
  alias Voter.Core.Game
  alias Voter.Core.Player

  def new_game() do
    Game.new()
  end

  def add_player(game, name) do
    player = Player.new() |> Player.name(name)
    Game.add_player(game, player)
  end
end
