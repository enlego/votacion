defmodule Voter.Core.Game do
  defstruct ~w[id active winner ranking players votes]a

  def new(), do: %__MODULE__{}  

  def add_player(game, player) do
    %{game | players: [player | game.players]}
  end

  def select_winner(game) do
    %{game | winner: "pipo.leigh@gmail.com"}
  end

  def finish(game) do
    game
    |> select_winner()
    |> close()
  end
  
  def activate(game), do: %{game | active: true}
  def close(game), do: %{game | active: false}

  def add_vote(game, vote) do
    %{game | votes: [vote | game.votes]}
  end

  def select_vote_from(email) do
    Access.filter(&match?(%{email: ^email}, &1))
  end

  def calculate_ranking do
    # calcula el ranking de jugadores para imprimir en pantalla
  end
end
