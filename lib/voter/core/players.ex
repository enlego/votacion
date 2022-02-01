defmodule Voter.Core.Player do
  defstruct [:name]

  def new(name) do
    player = new() |> name(name)
  end
  
  defp new(), do: %__MODULE__{}
 
  defp name(player, name) do
    %{player | name: name}
  end
end
