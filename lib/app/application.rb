class Application
  def main
    begin
      # --- Welcome ---
      puts "|-----------------------------------|"
      puts "| This is my version of tic-tac-toe |"
      puts "| I hope it will please you         |"
      puts "|-----------------------------------|"
      puts
      puts "Let's to try it!"
      
      # --- Create new game inastance ---
      game = Game.new()
      # Receive palyers ---
      game.recieve_players
      
      # --- Start the part
      game.start_game
      
      until (game.part_is_finished || game.grid.has_tokens_aligned?)
        # --- Show grid ---
        Show.new(game.grid).show_grid
        
        # --- one of the two player is playing
        game.a_player_is_playing
      end

      if (game.part_is_finished)
        puts "DRAW!!!"
      else
        if !game.players[0].status
          puts "Congratulations #{game.players[0].name}! ypu won"
        else
          puts "Congratulations #{game.players[1].name}! ypu won"
        end
      end

      # Ask to launch a new part ---
      begin
        print 'Another part ? [y/n] '
        answer = gets.chomp
      end while (answer != 'y' && answer != 'n')
    end while (answer == 'y')
  end
end