class Player
  attr_accessor :name, :symbol, :token, :status
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @status = false
    @token = Token.new(@symbol)
  end
  
  def is_it_my_turn?
    @status
  end

  def switch_status
    if @status == true
      @status = false 
    else
      @status = true
    end
  end
end