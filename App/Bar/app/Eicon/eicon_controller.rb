require 'rho/rhocontroller'
require 'helpers/browser_helper'

class EiconController < Rho::RhoController
  include BrowserHelper

  # GET /Eicon
  def index  
    @eicons = Eicon.find(:all,:order=>"created_at")
    $event_id = @params['id']
    @event= Event.find(@params['id'])
    $right_image = @event.right_filename
    
    render :back => '/app'
  end

  # GET /Eicon/{1}
  def show
    @eicon = Eicon.find(@params['id'])
    if @eicon
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Eicon/new
  def new
    @eicon = Eicon.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Eicon/{1}/edit
  def edit
    @eicon = Eicon.find(@params['id'])
    if @eicon
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Eicon/create
  def create
    @eicon = Eicon.create(@params['eicon'])
    redirect :action => :index
  end

  # POST /Eicon/{1}/update
  def update
    @eicon = Eicon.find(@params['id'])
    @eicon.update_attributes(@params['eicon']) if @eicon
    redirect :action => :index
  end

  # POST /Eicon/{1}/delete
  def delete
    @eicon = Eicon.find(@params['id'])
    @eicon.destroy if @eicon
    redirect :action => :index  
  end
end
