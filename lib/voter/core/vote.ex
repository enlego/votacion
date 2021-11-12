defmodule Voter.Core.Vote do
  defstruct ~w[id email player timestamp]a

  def new(), do: %__MODULE__{timestamp: DateTime.utc_now()}

  def update_email(vote, email) do
     %{vote | email: email}
  end
 
  def update_player(vote, player) do
    %{vote | player: player}
  end
end
