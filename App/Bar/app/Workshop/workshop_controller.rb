require 'rho/rhocontroller'
require 'helpers/browser_helper'

class WorkshopController < Rho::RhoController
  include BrowserHelper

  # GET /Workshop
  def index
    @workshops = Workshop.find(:all)
    cond = {
                :conditions => { 
                  {
                    :name => 'event_id', 
                    :op => '='
                  } => $event_id
                }   
              }
      @presentations = Presentation.find(:all,:conditions=>{ :event_id => $event_id },:select => "workshop_id")
#    @pres = @presentations.group_by  {|item| item[:workshop_id]}
#          puts "PRESSSSSSS#{@pres}"
      puts "Presentations:-#{@presentations}"
  
      render :back => '/app'
  end

  # GET /Workshop/{1}
  def show
    @workshop = Workshop.find(@params['id'])
    if @workshop
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Workshop/new
  def new
    @workshop = Workshop.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Workshop/{1}/edit
  def edit
    @workshop = Workshop.find(@params['id'])
    if @workshop
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Workshop/create
  def create
    @workshop = Workshop.create(@params['workshop'])
    redirect :action => :index
  end

  # POST /Workshop/{1}/update
  def update
    @workshop = Workshop.find(@params['id'])
    @workshop.update_attributes(@params['workshop']) if @workshop
    redirect :action => :index
  end

  # POST /Workshop/{1}/delete
  def delete
    @workshop = Workshop.find(@params['id'])
    @workshop.destroy if @workshop
    redirect :action => :index  
  end
end
