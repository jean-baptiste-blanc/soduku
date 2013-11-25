class Cell

  LENGTH = 9
  BOX_LENGTH = 3
  
	attr_reader :value , :candidates
	attr_accessor :position

	def initialize(value= nil,index = nil)
		@value = value
		@candidates = []
    initial_candidates
		@position = {}
    assign_position(index) unless index.nil?
	end

  def value=(value)
    @value = value if value.between?(0,9)
  end

  def filled_out?
  	 @value != 0 && !@value.nil?
  end

  def candidates=(number)
  	@candidates << number if number.between?(1,9) # else what? How do I know something happened? do I have to know?
  end

  def remove_candidate(number)
  	@candidates.delete(number)
  end

  def solve!
  	@value = @candidates.delete(@candidates.first) if @candidates.length == 1
  end

  def same_position_as?(other, direction)
  	self.position[direction] == other.position[direction]
  end

  def initial_candidates
    # WFT MEANS N?!?!?!?
    (1..LENGTH).each {|n| candidates << n}  if candidates == []
  end

    def calculate_position_x(index)
    (index % LENGTH)
  end
  
  def calculate_position_y(index)
    (index / LENGTH)
  end

  def calculate_position_box(index)
    (calculate_position_x(index) / BOX_LENGTH ) + (calculate_position_y(index) / BOX_LENGTH ) * BOX_LENGTH
  end

  def assign_position(index)
      position[:x] = calculate_position_x(index)
      position[:y] = calculate_position_y(index)
      position[:box] = calculate_position_box(index)
  end

end