defmodule Voter.Boundary.GameServer do
 alias Voter.Core.Game

# Callbacks
	@impl true
  def init(_params) do
    {:ok, Game.new()}
  end

  @impl true
  def handle_call({:add_player,player}, _from, game) do
		new_game = Game.add_player(game,player)
		players = new_game.players
    {:reply, players, new_game}
  end

	 @impl true
	 def handle_call({:add_vote,vote}, _from, game) do
		 new_game = Game.add_vote(game,vote)
		 votes = new_game.votes
	   {:reply, votes, new_game}
	  end

		@impl true
	  def handle_call({:view}, _from, game) do
		 {:reply,   game ,  game}
	  end

		@impl GenServer
	  def handle_call({:activate},_from, game) do
     new_game = activate(game)
		 status = new_game.active
     {:reply,status,new_game}
    end
		
		@impl GenServer
	  def handle_call({:close},_from, game) do
     new_game = close(game)
		 status = new_game.active
     {:reply,status,new_game}
    end


# Función de API	
	  def start do
		 GenServer.start(GameServer, nil)
	  end

	  def add_player(game_server, name) do
		 player = Player.new() |> Player.name(name)
		 GameServer.call(game_server,{:add_player,player})
	  end
	
	  def add_vote(game_server,email,name) do
			player = Player.new() |> Player.name(name)
			vote = Vote.new() 
						|> Vote.update_email(email)
						|> Vote.update_player(player)
			Gamesever.call(game_server,{:add_vote,vote})
	  end
	
	  def view_game(game_server) do
		 GenServer.call(game_server,{:view})
	  end

	  def select_winner() do
	  end

	  def activate() do
		 GenServer.call(game_server,{:activate})
	  end
	
	  def close() do
			GenServer.call(game_server,{:close})
	  end

    def put(pid, key, value) do
	   GenServer.cast(pid, {:put, key, value})
    end

    def get(pid, key) do
	   GenServer.call(pid, {:get, key})
    end
end
