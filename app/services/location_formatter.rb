class LocationFormatter < ApplicationService

  def initialize location
    @location = location
  end

  def call
    a = @location.scan /(?:\[.*?\]|[^,])+/
  end

end
