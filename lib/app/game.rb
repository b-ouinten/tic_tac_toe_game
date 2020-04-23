class Game
  attr_accessor :players, :grid
  
  def initialize()
    @grid = Grid.new    
    @players = []
  end
  
  def recieve_players
    symbol = ''
    2.times { |i|
      puts "-" * 50
      print "#{i+1}th player! Enter your name please > "
      name = gets.chomp
      if i < 1
        begin
          print "Enter your symbol (X or O) > "
          symbol = gets.chomp
          puts "I said X or O" if (symbol != 'X' && symbol != 'O')
        end while (symbol != 'X' && symbol != 'O')
      else
        if symbol == 'O'
          puts "You have only 'X'"
          symbol = 'X'
        else
          puts "You have only 'O'"
          symbol = 'O'
        end

        #--- Pause ---
        puts "Press enter to continue ..."
        gets
      end
      @players << Player.new(name, symbol)
    }
  end

  def start_game
    players.each { |player|
    if player.symbol == 'X'
      player.switch_status
      puts "Be the first to start, #{player.name}, these are the rituals, you chose 'X'."
      puts "Press enter to contine"
      gets
    end
    }
  end

  def a_player_is_playing
    players.each { |player|
      if player.is_it_my_turn?
        puts "---------------------------------------------------------------------"
        puts "It's your turn #{player.name}"
        begin
          print "On which cell you want put your token (A1 A2 A3 B1 B2 B3 C1 C2 C3)> "
          cell = gets.chomp
          puts "Bad answer! Try again please." if (cell != 'A1' && cell != 'A2' && cell != 'A3' && cell != 'B1' && cell != 'B2' && cell != 'B3' && cell != 'C1' && cell != 'C2' && cell != 'C3')
        end while (cell != 'A1' && cell != 'A2' && cell != 'A3' && cell != 'B1' && cell != 'B2' && cell != 'B3' && cell != 'C1' && cell != 'C2' && cell != 'C3')

        # --- Put a token in grid ---
        put_token_in_grid(player.token, cell)
      end

      # --- Switch player status ---
      player.switch_status
    }
  end

  def part_is_finished
    @grid.is_being_filled?
  end

  private
  def put_token_in_grid(token, cell)
    if @grid.content[cell[0]][cell[1]].symbol == ''
      @grid.content[cell[0]][cell[1]] = token
    else
      puts "There is already a token in this cell!"
      puts "Press enter to continue ..."
      gets
    end
  end
end