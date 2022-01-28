defmodule Voter.Core.Game do
  use GenServer

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

  def add_vote(game,vote) do
    %{game | votes: [vote | game.votes]}
  end

  @spec select_vote_from(any) ::
          (:get | :get_and_update, list, (any -> any) -> [{any, any}] | {list, list})
  def select_vote_from(email) do
    Access.filter(&match?(%{email: ^email}, &1))
  end

  def calculate_ranking do
    # calcula el ranking de jugadores para imprimir en pantalla
  end


  def start() do
    GenServer.start(__MODULE__, nil)
  end


  def add_player_to_server(game_server, player) do
    GenServer.call(game_server, {:add_player,player})
  end

  def add_vote_to_server(game_server,vote) do
    GenServer.call(game_server,{:add_vote,vote})
  end

  def view_game(game_server) do
    GenServer.call(game_server,{:view})
  end

  def activate_game_server(game_server) do
    GenServer.call(game_server,{:activate})
  end

  def close_game_server(game_server) do
    GenServer.call(game_server,{:close})
  end




  @impl GenServer
  def init(_) do
    {:ok,  new()}
  end


  @impl GenServer
  def handle_call({:add_player, player},_from,game) do
    new_game = add_player(game,player)
    players = new_game.players
    {:reply,players,new_game}
  end

  @impl GenServer
  def handle_call({:add_vote, vote},_from,game) do
    new_game = add_vote(game,vote)
    votes = new_game.votes
    {:reply,votes,new_game}
  end

  @impl GenServer
  def handle_call({:view},_from,game) do
    {:reply,   game ,  game}
  end

  @impl GenServer
  def handle_call({:activate},_from,game) do
    new_game = activate(game)
    status = new_game.active
    {:reply,status,new_game}
  end

  @impl GenServer
  def handle_call({:close},_from,game) do
    new_game = close(game)
    status = new_game.active
    {:reply,status,new_game}
  end




end
