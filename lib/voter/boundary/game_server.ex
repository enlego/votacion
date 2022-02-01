defmodule Voter.GameServer do
  use GenServer
  alias Voter.Core.Game
  
  # Función de API	
  def start(params) do
    GenServer.start(__MODULE__, params)
  end

  def add_player(game_server, player) do
    GenServer.call(game_server, {:add_player, player})
  end

  def add_vote(game_server, vote) do
    GenServer.call(game_server, {:add_vote, vote})
  end

  def view_game(game_server) do
    GenServer.call(game_server, {:view})
  end

  def select_winner(game_server) do
    GenServer.call(game_server, {:winner})
  end

  def activate(game_server) do
    GenServer.call(game_server, {:activate})
  end

  def close(game_server) do
    GenServer.call(game_server, {:close})
  end
 
  # Callbacks
  @impl true
  def init(_params) do
    {:ok, Game.new()}
  end

  @impl true
  def handle_call({:add_player, player}, _from, game) do
    new_game = Game.add_player(game, player)
    {:reply, new_game, new_game}
  end

  @impl true
  def handle_call({:add_vote, vote}, _from, game) do
    new_game = Game.add_vote(game, vote)
    {:reply, new_game, new_game}
  end

  @impl true
  def handle_call({:select_winner}, _from, game) do
    new_game = Game.select_winner(game)
    {:reply, new_game, new_game}
  end

  @impl true
  def handle_call({:view}, _from, game) do
    {:reply, game, game}
  end

  @impl GenServer
  def handle_call({:activate}, _from, game) do
    new_game = Game.activate(game)
    {:reply, new_game, new_game}
  end

  @impl GenServer
  def handle_call({:close}, _from, game) do
    new_game = Game.close(game)
    {:reply, new_game, new_game}
  end
end
