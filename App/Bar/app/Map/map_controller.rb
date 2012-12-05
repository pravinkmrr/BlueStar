require 'rho/rhocontroller'
require 'helpers/browser_helper'

class MapController < Rho::RhoController
  include BrowserHelper

  # GET /Map
  def index
    cond1 = {
            :conditions => { 
              {
                :name => 'event_id', 
                :op => '='
              } => $event_id
            }   
          }
    @maps = Map.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['name','filename'])
    render :back => '/app'
  end

  # GET /Map/{1}
  def show
    @map = Map.find(@params['id'])
    if @map
      System.open_url(Rho::RhoApplication::get_blob_path(@map.filename)) 
    else
      redirect :action => :index
    end
  end

  # GET /Map/new
  def new
    @map = Map.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Map/{1}/edit
  def edit
    @map = Map.find(@params['id'])
    if @map
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Map/create
  def create
    @map = Map.create(@params['map'])
    redirect :action => :index
  end

  # POST /Map/{1}/update
  def update
    @map = Map.find(@params['id'])
    @map.update_attributes(@params['map']) if @map
    redirect :action => :index
  end

  # POST /Map/{1}/delete
  def delete
    @map = Map.find(@params['id'])
    @map.destroy if @map
    redirect :action => :index  
  end
end
