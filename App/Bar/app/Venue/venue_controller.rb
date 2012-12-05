require 'rho/rhocontroller'
require 'helpers/browser_helper'

class VenueController < Rho::RhoController
  include BrowserHelper

  # GET /Venue
  def index
    cond1 = {
            :conditions => { 
              {
                :name => 'event_id', 
                :op => '='
              } => $event_id
            }   
          }
    @venues = Venue.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['name','filename'])
      render :back => '/app'
  end

  # GET /Venue/{1}
  def show
    @venue = Venue.find(@params['id'])
    if @venue
      System.open_url(Rho::RhoApplication::get_blob_path(@venue.filename)) 
    else
      redirect :action => :index
    end
  end

  # GET /Venue/new
  def new
    @venue = Venue.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Venue/{1}/edit
  def edit
    @venue = Venue.find(@params['id'])
    if @venue
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Venue/create
  def create
    @venue = Venue.create(@params['venue'])
    redirect :action => :index
  end

  # POST /Venue/{1}/update
  def update
    @venue = Venue.find(@params['id'])
    @venue.update_attributes(@params['venue']) if @venue
    redirect :action => :index
  end

  # POST /Venue/{1}/delete
  def delete
    @venue = Venue.find(@params['id'])
    @venue.destroy if @venue
    redirect :action => :index  
  end
end
