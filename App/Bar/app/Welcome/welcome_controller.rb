require 'rho/rhocontroller'
require 'helpers/browser_helper'

class WelcomeController < Rho::RhoController
  include BrowserHelper

  # GET /Welcome
  def index
    cond1 = {
            :conditions => { 
              {
                :name => 'event_id', 
                :op => '='
              } => $event_id
            }   
          }
    @welcomes = Welcome.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['name','filename'])
      render :back => '/app'
  end

  # GET /Welcome/{1}
  def show
    @welcome = Welcome.find(@params['id'])
    if @welcome
      System.open_url(Rho::RhoApplication::get_blob_path(@welcome.filename)) 
    else
      redirect :action => :index
    end
  end

  # GET /Welcome/new
  def new
    @welcome = Welcome.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Welcome/{1}/edit
  def edit
    @welcome = Welcome.find(@params['id'])
    if @welcome
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Welcome/create
  def create
    @welcome = Welcome.create(@params['welcome'])
    redirect :action => :index
  end

  # POST /Welcome/{1}/update
  def update
    @welcome = Welcome.find(@params['id'])
    @welcome.update_attributes(@params['welcome']) if @welcome
    redirect :action => :index
  end

  # POST /Welcome/{1}/delete
  def delete
    @welcome = Welcome.find(@params['id'])
    @welcome.destroy if @welcome
    redirect :action => :index  
  end
end
