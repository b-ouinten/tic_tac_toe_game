class Grid
  attr_accessor :content

  def initialize()
    @content = {"A1"=> Token.new(''), "A2" => Token.new(''), "A3" => Token.new(''),
                "B1"=> Token.new(''), "B2" => Token.new(''), "B3" => Token.new(''), 
                "C1"=> Token.new(''), "C2" => Token.new(''), "C3" => Token.new(''), }
  end

  def is_being_filled?
    @content.each_value { |v| return false if v.symbol == ''}
    true
  end
end