class EventsController < ApplicationController
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 10)
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
      others = params.require(:event).permit(:title, :text, :status,:resolved) 
      datetimehash = { "datetime" => datetime}
      mergehash = others.merge(datetimehash)
      
      return mergehash
      
    end
    
end
