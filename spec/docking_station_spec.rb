require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to('release_bike') }

  it 'capacity has been set' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'release_bike' do
  	it 'release a bike' do
  		bike = Bike.new
  		subject.dock(bike)
  		expect(subject.release_bike).to eq bike
  	end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  #it { is_expected.to respond_to('bikes') }

  it 'returns docked bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'expect an error' do
  	expect { subject.release_bike }.to raise_error('No bikes available')
  end

  describe '#dock' do
    it 'expect an error if dock full' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
