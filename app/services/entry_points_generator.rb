class EntryPointsGenerator < ApplicationService

  def initialize entry_point
    @entry_point = entry_point
  end

  def call
    ['A', 'B', 'C']
  end

end
