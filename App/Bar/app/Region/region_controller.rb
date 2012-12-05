require 'rho/rhocontroller'
require 'helpers/browser_helper'

class RegionController < Rho::RhoController
  include BrowserHelper

  # GET /Region
  def index
    @regions = Region.find(:all,:order=>"region_name")
    render :back => '/app'
  end

  # GET /Region/{1}
  def show
    @region = Region.find(@params['id'])
    if @region
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Region/new
  def new
    @region = Region.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Region/{1}/edit
  def edit
    @region = Region.find(@params['id'])
    if @region
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Region/create
  def create
    @region = Region.create(@params['region'])
    redirect :action => :index
  end

  # POST /Region/{1}/update
  def update
    @region = Region.find(@params['id'])
    @region.update_attributes(@params['region']) if @region
    redirect :action => :index
  end

  # POST /Region/{1}/delete
  def delete
    @region = Region.find(@params['id'])
    @region.destroy if @region
    redirect :action => :index  
  end
end
