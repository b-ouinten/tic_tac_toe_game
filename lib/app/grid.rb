class Grid
  attr_accessor :content, :content_to_matrix
  
  def initialize()
    @content = {"A"=>{ "1" => Token.new(Ssymbol.new('')), "2" => Token.new(Ssymbol.new('')), "3" => Token.new(Ssymbol.new(''))},
                "B"=>{ "1" => Token.new(Ssymbol.new('')), "2" => Token.new(Ssymbol.new('')), "3" => Token.new(Ssymbol.new(''))},
                "C"=>{ "1" => Token.new(Ssymbol.new('')), "2" => Token.new(Ssymbol.new('')), "3" => Token.new(Ssymbol.new(''))}}
    @content_to_matrix = []
  end
  
  def is_being_filled?
    @content.each_value { |v| 
      v.each_value {
        |vs| return false if vs.symbol.character == ''
      }
    }
    true
  end
  
  def has_tokens_aligned?
    to_matrix
    ary = @content_to_matrix.map(&:clone)
    ary.map! { |v|      
      v.map! { |vs|
        vs.symbol
      }
    }

    rows = ary
    columns = ary.transpose
    diagonal1 = []
    diagonal2 = []
    ary.each_index { |index|  
      diagonal1 << ary[index][index]
      diagonal2 << ary[index][ary.count - 1 - index]
    }
    r = rows.map { |item| item.uniq.count}
    c = columns.map { |item| item.uniq.count}
    d1 = diagonal1.uniq.count
    d2 = diagonal2.uniq.count
    
    final = r + c << d1 << d2
    final.each { |item| return true if item == 1 }
    return false
  end

  private
  def to_matrix
    @content_to_matrix = @content.values.map{ |v| v.values}
  end
end