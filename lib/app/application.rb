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
      game.play
      
      # Ask to launch a new part ---
      begin
        print 'Another part ? [y/n] '
        answer = gets.chomp.downcase
      end while (answer != 'y' && answer != 'n')
    end while (answer == 'y')
  end
end