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
      binding.pry
      # Receive palyers ---
      game.recieve_players
      
      # --- Start the part
      game.start_game
      
      # Until (game.part_is_finished || )
        # --- Show grid ---
        Show.new(game.grid).show_grid

        # --- one of the two player is playing
        game.a_player_is_playing

      # end

      # Ask to launch a new part ---
      begin
        print 'Another part ? [y/n] '
        answer = gets.chomp
      end while (answer != 'y' && answer != 'n')
    end while (answer == 'y')
  end
end