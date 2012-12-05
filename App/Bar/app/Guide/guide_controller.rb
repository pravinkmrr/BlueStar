require 'rho/rhocontroller'
require 'helpers/browser_helper'

class GuideController < Rho::RhoController
  include BrowserHelper

  # GET /Guide
  def index
    cond1 = {
            :conditions => { 
              {
                :name => 'event_id', 
                :op => '='
              } => $event_id
            }   
          }
    @guides = Guide.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['name','filename'])
    render :back => '/app'
  end

  # GET /Guide/{1}
  def show
    @guide = Guide.find(@params['id'])
    if @guide
      System.open_url(Rho::RhoApplication::get_blob_path(@guide.filename)) 
    else
      redirect :action => :index
    end
  end

  # GET /Guide/new
  def new
    @guide = Guide.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Guide/{1}/edit
  def edit
    @guide = Guide.find(@params['id'])
    if @guide
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Guide/create
  def create
    @guide = Guide.create(@params['guide'])
    redirect :action => :index
  end

  # POST /Guide/{1}/update
  def update
    @guide = Guide.find(@params['id'])
    @guide.update_attributes(@params['guide']) if @guide
    redirect :action => :index
  end

  # POST /Guide/{1}/delete
  def delete
    @guide = Guide.find(@params['id'])
    @guide.destroy if @guide
    redirect :action => :index  
  end
end
