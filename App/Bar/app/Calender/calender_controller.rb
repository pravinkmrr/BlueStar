require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'time'
require 'rho/rhoevent.rb'

class CalenderController < Rho::RhoController
  include BrowserHelper

  # GET /Calender
  def index
    cond1 = {
                :conditions => { 
                  {
                    :name => 'event_id', 
                    :op => '='
                  } => $event_id
                }   
              }
    @calenders = Calender.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['title','message','time','date'])
    render :back => '/app'
  end

  # GET /Calender/{1}
  def show
    @calender = Calender.find(@params['id'])
    if @calender
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Calender/new
  def new
    @calender = Calender.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Calender/{1}/edit
  def edit
    @calender = Calender.find(@params['id'])
    if @calender
      event = Hash.new();
      startdate = @calender.date.to_s
      enddate = @calender.date.to_s
      event[Rho::RhoEvent::ID] = ""
      event[Rho::RhoEvent::TITLE] = @calender.title
      event[Rho::RhoEvent::NOTES] = @calender.message 
      event[Rho::RhoEvent::LOCATION] = "Carnival Imagination"
      event[Rho::RhoEvent::START_DATE] = startdate
      event[Rho::RhoEvent::END_DATE] = enddate
      puts "created#{event}"
      new_event = Rho::RhoEvent.create!(event)
      new_id = new_event['id']
            puts 'created new event with id = ' + new_id
    else
      redirect :action => :index
    end
  end

  # POST /Calender/create
  def create
    @calender = Calender.create(@params['calender'])
    redirect :action => :index
  end

  # POST /Calender/{1}/update
  def update
    @calender = Calender.find(@params['id'])
    @calender.update_attributes(@params['calender']) if @calender
    redirect :action => :index
  end

  # POST /Calender/{1}/delete
  def delete
    @calender = Calender.find(@params['id'])
    @calender.destroy if @calender
    redirect :action => :index  
  end
end
