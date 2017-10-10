class EventsController < ApplicationController
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 5)
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def create       
    @event = Event.new(event_params)
    
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
    
  end
  def feed
    @events = Event.where("resolved = ?", false)
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end
  def update
    @event = Event.find(params[:id])
    
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
    
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
 
    redirect_to events_path
  end
  
  private 
    def event_params
      datetime = DateTime.new(params[:event][:year].to_i, params[:event][:month].to_i, params[:event][:day].to_i, params[:event][:hour].to_i, params[:event][:minute].to_i)
      if params[:event][:resolved]
        resolvetime = Time.now + 3600
        resolvetimehash = { "resolvetime" => resolvetime}
      end
      others = params.require(:event).permit(:title, :text, :status,:resolved) 
      datetimehash = { "datetime" => datetime}
      if params[:event][:resolved]
        mergehashone = others.merge(datetimehash)
        mergehashtwo = mergehashone.merge(resolvetimehash)
        return mergehashtwo
      else
        mergehashone = others.merge(datetimehash)
        return mergehashone
      end

      
    end
    
end
