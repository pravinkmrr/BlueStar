require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AdvertisementController < Rho::RhoController
  include BrowserHelper

  # GET /Advertisement
  def index
    @advertisements = Advertisement.find(:all)
    render :back => '/app'
  end

  # GET /Advertisement/{1}
  def show
    @advertisement = Advertisement.find(@params['id'])
    if @advertisement
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Advertisement/new
  def new
    @advertisement = Advertisement.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Advertisement/{1}/edit
  def edit
    @advertisement = Advertisement.find(@params['id'])
    if @advertisement
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Advertisement/create
  def create
    @advertisement = Advertisement.create(@params['advertisement'])
    redirect :action => :index
  end

  # POST /Advertisement/{1}/update
  def update
    @advertisement = Advertisement.find(@params['id'])
    @advertisement.update_attributes(@params['advertisement']) if @advertisement
    redirect :action => :index
  end

  # POST /Advertisement/{1}/delete
  def delete
    @advertisement = Advertisement.find(@params['id'])
    @advertisement.destroy if @advertisement
    redirect :action => :index  
  end
end
