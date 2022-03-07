class EntryPointsGenerator < ApplicationService

  def initialize entry_point
    @entry_point = entry_point
  end

  def call
    1.upto(@entry_point).map do |point|
      (point + 96).chr.upcase
    end
  end

end
