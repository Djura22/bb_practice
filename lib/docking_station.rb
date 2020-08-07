require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

	def release_bike
    fail 'No bikes available' if empty?
    while true do
      bike = @bikes.pop
      if bike.broken? == true
        #fail 'Bike is broken'
        @bikes.unshift(bike)
      elsif bike.broken? != true
        return bike
      else
        fail 'No bikes available'
      break
      end
    end
  end

	def dock(bike)
    fail 'Docking station full' if full?
		@bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
	
end


