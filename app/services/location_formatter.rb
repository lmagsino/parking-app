class LocationFormatter < ApplicationService

  #This will match array separated by comma
  LOCATION_SPLIT_REGEX = /(?:\[.*?\]|[^,])+/


  def initialize location
    @location = location
  end

  def call
    a = @location.scan LOCATION_SPLIT_REGEX
  end

end
