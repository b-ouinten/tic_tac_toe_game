class Player
  attr_accessor :name, :symbol, :new_token, :status
  
  def initialize(name, symbol)
    @name = name
    @symbol = Ssymbol.new(symbol)
    @status = false
    @new_token = nil
  end
  
  def is_it_my_turn?
    @status
  end

  def take_a_new_token
    @new_token = Token.new(@symbol)
  end

  def switch_status
    if @status == true
      @status = false 
    else
      @status = true
    end
  end
end