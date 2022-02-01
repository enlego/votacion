defmodule Voter do
  alias Voter.Core.Game
  alias Voter.Core.Player
  alias Voter.Core.Vote

  def new_game() do
    Game.new()
  end

  def add_player(game, name) do
    player =
      Player.new()
      |> Player.name(name)

    Game.add_player(game, player)
  end

  def add_vote(game, email, player_name) do
    playerstruct = Player.new() |> Player.name(player_name)

    vote =
      Vote.new()
      |> Vote.update_email(email)
      |> Vote.update_player(playerstruct)

    Game.add_vote(game, vote)
  end

  def activate(game) do
    Game.activate(game)
  end

  def close(game) do
    Game.close(game)
  end

  def select_vote_from(email) do
    Game.select_vote_from(email)
  end

  def select_winner(game) do
    Game.select_winner(game)
  end

  def finish_game(game) do
    Game.finish(game)
  end
end
