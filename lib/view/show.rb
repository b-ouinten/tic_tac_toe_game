class Show
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def show_grid
    system "clear"
    puts "-" * 12
    puts "Next round : "
    puts
    puts "     1    2    3  "
    puts "   |-------------|"
    i = 0
    rows_labels = ['A', 'B', 'C']
    @grid.content.each_value { |v|
      print(" ", rows_labels[i], " ")
      v.each_value{ |vs| print("|", vs.symbol.character.center(3) , "|") }
      print("\n   |-------------|\n")
      i += 1
    }
  puts
  end
end