class CalendarEventsController < ApplicationController
    before_action :set_calendar_event, only: [:show, :edit, :update, :destroy]
  
    def index
      @calendar_events = CalendarEvent.all
      respond_to do |format|
        format.html 
        format.json { render json: @calendar_events }
      end
    end
  
    def show
    end
  
    def new
      @calendar_event = CalendarEvent.new
    end
  
    def create
      @calendar_event = CalendarEvent.new(calendar_event_params)
  
      if @calendar_event.save
        flash[:notice] = 'Calendar event was successfully created.'
        redirect_to calendar_event_path(@calendar_event)
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @calendar_event.update(calendar_event_params)
        redirect_to calendar_path, notice: 'Calendar event was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @calendar_event.destroy
      redirect_to calendar_path, notice: 'Calendar event was successfully destroyed.'
    end
  
    private
  
    def set_calendar_event
      @calendar_event = CalendarEvent.find(params[:id])
    end
  
    def calendar_event_params
      params.require(:calendar_event).permit(:title, :description, :start_date, :end_date)
    end
  end
  def show
    @calendar_event = CalendarEvent.find(params[:id])
  end