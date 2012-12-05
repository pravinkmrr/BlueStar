require 'rho/rhocontroller'
require 'helpers/browser_helper'

class KeynoteController < Rho::RhoController
  include BrowserHelper

  # GET /Keynote
  def index
    cond1 = {
            :conditions => { 
              {
                :name => 'event_id', 
                :op => '='
              } => $event_id
            }   
          }
    @keynotes = Keynote.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['name','filename'])
    render :back => '/app'
  end

  # GET /Keynote/{1}
  def show
    @keynote = Keynote.find(@params['id'])
    if @keynote
      System.open_url(Rho::RhoApplication::get_blob_path(@keynote.filename)) 
    else
      redirect :action => :index
    end
  end

  # GET /Keynote/new
  def new
    @keynote = Keynote.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Keynote/{1}/edit
  def edit
    @keynote = Keynote.find(@params['id'])
    if @keynote
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Keynote/create
  def create
    @keynote = Keynote.create(@params['keynote'])
    redirect :action => :index
  end

  # POST /Keynote/{1}/update
  def update
    @keynote = Keynote.find(@params['id'])
    @keynote.update_attributes(@params['keynote']) if @keynote
    redirect :action => :index
  end

  # POST /Keynote/{1}/delete
  def delete
    @keynote = Keynote.find(@params['id'])
    @keynote.destroy if @keynote
    redirect :action => :index  
  end
end
