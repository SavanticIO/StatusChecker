class ResolvedController < ApplicationController
  def index
    time = Time.now + 3600
    @resolved = Event.where("resolved = ? and datetime <= ?", true, time)
  end
end
