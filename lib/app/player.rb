class Player
  attr_accessor :name, :symbol, :new_token, :status
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @status = false
  end
  
  def take_new_token
    @new_token = Token.new(@symbol)
  end

  def is_it_my_turn?
    @status
  end

  def switch_status
    @status = false if @status == true
    @status = true if @status == false
  end
end