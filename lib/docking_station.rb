require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

	def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

	def dock(bike)
		fail 'Docking station full' if @bikes. >= 20
		@bikes << bike
	end
  DEFAULT_CAPACITY = 20
	attr_reader :bikes

end


