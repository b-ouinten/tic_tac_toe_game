class Show
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def show_grid
    system "clear"
    puts "-" * 50
    puts "Next round : "
    puts
    puts "     1    2    3  "
    puts "   |-------------|"
    i = 1
    j = 0
    rows_labels = ['A', 'B', 'C']
    @grid.content.each_value { |v|
      if (i%3==1)
        print(" ", rows_labels[j], " ")
        j += 1
      end
      print("|", v.symbol.center(3) , "|")
      if i%3==0
        print("\n   |-------------|\n")
      else
        print("")
      end
      i += 1
    }
  puts
  end
end