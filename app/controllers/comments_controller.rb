class CommentsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new
  end
  def show
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
  end
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    updatehash = { "resolved" => params[:comment][:event_attributes][:resolved]}
    @event.update(updatehash)
    redirect_to event_path(@event)
  end
 def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to event_path(@event)
  end
  def edit
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
  end
  def update
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    updatehash = { "resolved" => params[:comment][:event_attributes][:resolved]}
    if @comment.update(comment_params)
      @event.update(updatehash)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
