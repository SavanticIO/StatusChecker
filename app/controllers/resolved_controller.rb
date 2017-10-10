class ResolvedController < ApplicationController
  def index
    time = Time.now + 3600
    resolved = Event.where("resolved = ? and datetime <= ?", true, time)
    @resolvedpageinate = resolved.paginate(:page => params[:page], :per_page => 10)
  end
end
