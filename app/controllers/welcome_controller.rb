class WelcomeController < ApplicationController
  def index
    time = Time.now + 3600
    @active = Event.where("resolved = ? and datetime <= ?", false, time)
    future = Event.where(["resolved = ? and datetime > ?", false, time])
    @futurepage = future.paginate(:page => params[:page], :per_page => 5)
  end
end
