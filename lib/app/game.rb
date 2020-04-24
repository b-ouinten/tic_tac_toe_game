class Game
  attr_accessor :players, :grid, :show
  
  def initialize()
    @grid = Grid.new    
    @players = []
    @show = Show.new(grid)
  end

  def play
    # --- Start the part
    start_game
      
    until (a_part_is_finished)
      # --- one of the two player is playing
      a_player_is_playing
    end
    
    # --- A part is finished ---
    show_part_result
  end
  
  private
  def start_game
    # Receive palyers ---
    recieve_players

    # --- Determine the first to start player ---
    players.each { |player|
    if player.symbol.character == 'X'
      player.switch_status
      puts "Be the first to start, #{player.name}, these are the rituals, you chose 'X'."
      puts "Press enter to contine"
      gets

      # --- Show a void grid ---
      @show.show_grid
    end
    }
  end

  def recieve_players
    symbol = ''
    2.times { |i|
      puts "-" * 45
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

  def a_player_is_playing
    players.each { |player|
      if player.is_it_my_turn?
        puts "-" * 23
        puts "It's your turn #{player.name}"
        begin
          print "On which cell (a1 a2 a3 b1 b2 b3 b1 c2 c3) you want put your token [#{player.symbol.character}] > "
          cell = gets.chomp.upcase
          puts "Bad answer! Try again please." if (cell != 'A1' && cell != 'A2' && cell != 'A3' && cell != 'B1' && cell != 'B2' && cell != 'B3' && cell != 'C1' && cell != 'C2' && cell != 'C3')
        end while (cell != 'A1' && cell != 'A2' && cell != 'A3' && cell != 'B1' && cell != 'B2' && cell != 'B3' && cell != 'C1' && cell != 'C2' && cell != 'C3')

        # --- A player take a new token ---
        player.take_a_new_token
        
        # --- Put a token in grid ---
        is_valid = put_token_in_grid(player.new_token, cell)

        # --- Switch players status ---
        if (is_valid)
          players.each { |player|
            player.switch_status
          }
        end
        # --- Show grid ---
        @show.show_grid
      end
    }
  end

  def put_token_in_grid(token, cell)
    if @grid.content[cell[0]][cell[1]].symbol.character == ''
      @grid.content[cell[0]][cell[1]] = token
      return true
    else
      puts "There is already a token in this cell!"
      puts "Press enter to retry ..."
      gets
      return false
    end
  end

  def a_part_is_finished
    @grid.is_being_filled? || @grid.has_tokens_aligned?
  end

  def show_part_result
    if (@grid.has_tokens_aligned?)
      players.each { |player|
        puts "Congratulations #{player.name}! you won." if !player.status
      }
    else
      puts "DRAW!!! No winner."
    end
    puts
  end

end