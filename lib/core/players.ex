defmodule Voter.Core.Player do
  defstruct ~w[name]a

  def new(name) do
    %__MODULE__{
      name: name
    }
  end
end
