require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PresentationController < Rho::RhoController
  include BrowserHelper

  # GET /Presentation
  def index
    cond1 = {
            :conditions => { 
              {
                :name => 'workshop_id', 
                :op => '='
              } => @params["wid"]
            }   
          }
            cond2 = {
            :conditions => { 
              {
                :name => 'event_id', 
                :op => '='
              } => $event_id
            }   
          }
    @presentations = Presentation.find(:all,:conditions=>[cond1,cond2],:op=>"AND",:select => ['name','filename'])
    render :back => '/app'
  end

  # GET /Presentation/{1}
  def show
    @presentation = Presentation.find(@params['id'])
    if @presentation
      System.open_url(Rho::RhoApplication::get_blob_path(@presentation.filename)) 
    else
      redirect :action => :index
    end
  end

  # GET /Presentation/new
  def new
    @presentation = Presentation.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Presentation/{1}/edit
  def edit
    @presentation = Presentation.find(@params['id'])
    if @presentation
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Presentation/create
  def create
    @presentation = Presentation.create(@params['presentation'])
    redirect :action => :index
  end

  # POST /Presentation/{1}/update
  def update
    @presentation = Presentation.find(@params['id'])
    @presentation.update_attributes(@params['presentation']) if @presentation
    redirect :action => :index
  end

  # POST /Presentation/{1}/delete
  def delete
    @presentation = Presentation.find(@params['id'])
    @presentation.destroy if @presentation
    redirect :action => :index  
  end
end
