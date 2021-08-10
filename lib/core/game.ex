defmodule Voter.Core.Game do
  defstruct ~w[id active winner ranking players votes]a

  def new(id) do
    %__MODULE__{
      id: id,
      active: true,
      winner: nil,
      ranking: nil,
      players: [],
      votes: []
    }
  end

  def add_player(player, game) do
    %{game | players: [player | game.players] }
  end

  def select_winner(game) do
    %{game | winner: "pipo.leigh@gmail.com" }
  end

  def finish(game) do
    game
    |> select_winner()
    |> close()
  end

  def close(game) do
    %{game | active: false}
  end

  def add_vote(vote, game) do
    %{game | votes: [vote | game.votes]}
  end

  def select_vote_from(email) do
    Access.filter(&match?(%{email: email}, &1))
  end

  def calculate_ranking do
    # calcula el ranking de jugadores para imprimir en pantalla
  end
end
