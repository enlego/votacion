defmodule Voter.Core.Player do
  defstruct ~w[id name]a

  def new(), do: %__MODULE__{}

  def name(player, name) do
    %{player | name: name }
  end 
end
