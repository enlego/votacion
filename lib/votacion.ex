defmodule Votacion do
    def jugadores() do
    jugadores = %{
        :enrique => 0,
        :agustin => 0,
        :victoria => 0
      }
    end

    def get_score(jugador) do
      Votacion.jugadores |>
      Map.get(jugador)
    end

    def update_score(jugador) do
      Votacion.jugadores |>
      Map.put(jugador, Votacion.get_score(jugador)+1)
    end
end
