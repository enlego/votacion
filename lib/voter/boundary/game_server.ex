defmodule Voter.Boundary.GameServer do
  alias Voter.Core.Game
  use GenServer

  def init(game) when is_map(game) do
    {:ok, game}
  end
  
  def init(_game), do: {:error, "The game must be a map"}

  def handle_call({:add_player, player}, _from, game) do
    new_game = game
    |> Game.add_player(player)

    {:reply, :ok, new_game}
  end
end
