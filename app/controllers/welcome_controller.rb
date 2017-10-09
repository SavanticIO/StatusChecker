class WelcomeController < ApplicationController
  def index
    time = Time.now + 3600
    @active = Event.where("resolved = ? and datetime <= ?", false, time)
    @future = Event.where(["resolved = ? and datetime > ?", false, time])
              
  end
end
