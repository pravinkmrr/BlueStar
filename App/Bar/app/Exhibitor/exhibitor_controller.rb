require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ExhibitorController < Rho::RhoController
  include BrowserHelper

  # GET /Exhibitor
  def index
    cond1 = {
            :conditions => { 
              {
                :name => 'event_id', 
                :op => '='
              } => $event_id
            }   
          }
    @exhibitors = Exhibitor.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['name','filename'])
    render :back => '/app'
  end

  # GET /Exhibitor/{1}
  def show
    @exhibitor = Exhibitor.find(@params['id'])
    if @exhibitor
              System.open_url(Rho::RhoApplication::get_blob_path(@exhibitor.filename)) 
            else
              redirect :action => :index
            end
  end

  # GET /Exhibitor/new
  def new
    @exhibitor = Exhibitor.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Exhibitor/{1}/edit
  def edit
    @exhibitor = Exhibitor.find(@params['id'])
    if @exhibitor
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Exhibitor/create
  def create
    @exhibitor = Exhibitor.create(@params['exhibitor'])
    redirect :action => :index
  end

  # POST /Exhibitor/{1}/update
  def update
    @exhibitor = Exhibitor.find(@params['id'])
    @exhibitor.update_attributes(@params['exhibitor']) if @exhibitor
    redirect :action => :index
  end

  # POST /Exhibitor/{1}/delete
  def delete
    @exhibitor = Exhibitor.find(@params['id'])
    @exhibitor.destroy if @exhibitor
    redirect :action => :index  
  end
end
