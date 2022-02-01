defmodule Voter.Core.Game do
  alias Voter.Core.Player
  alias Voter.Core.Vote

  defstruct active: true,  winner: nil, ranking: nil, players: [],  votes: []

  def new(), do: %__MODULE__{}

  def add_player(game, player) do
    player = Player.new(player)
    %{game | players: [player | game.players]} 
  end

  def select_winner(game) do
    %{game | winner: "pipo.leigh@gmail.com"}
  end

  def activate(game), do: %{game | active: true}
  def close(game), do: %{game | active: false}

  def add_vote(game, vote_for) do
    vote = Vote.new(vote_for)    
    %{game | votes: [vote | game.votes]}
  end

  def calculate_ranking do
    # calcula el ranking de jugadores para imprimir en pantalla
  end
end
