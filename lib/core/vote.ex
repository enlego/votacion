defmodule Voter.Core.Vote do
  defstruct ~w[id email player timestamp]a

  def new(id, email, player) do
    %__MODULE__{
    id: id,
    email: email,
    player: player,
    timestamp: DateTime.utc_now
  }
  end

  def update(vote, player) do
    %{vote | player: player}
  end
end
