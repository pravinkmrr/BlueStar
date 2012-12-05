require 'rho/rhocontroller'
require 'helpers/browser_helper'

class LinkController < Rho::RhoController
  include BrowserHelper

  # GET /Link
  def index
    @links = Link.find(:all)
    puts "Links: #{@params.inspect}"
    render :back => '/app'
  end
  
  def open_link
    puts "Region ID:#{$region_id}"
    cond1 = {
        :conditions => { 
          {
            :name => 'region_id', 
            :op => '='
          } =>$region_id
        }   
      }
        cond2 = {
        :conditions => { 
          {
            :name => 'type_id', 
            :op => '='
          } => @params["type"]
        }   
      }
        @link= Link.find(:all,:conditions=>[cond1,cond2],:op=>"AND",:select => ['links_url'])
        puts "CONDITIONS:#{cond2} #{cond1}"
        puts "Link#{@link}"          
        if @link.any?
            System.open_url(@link[0].links_url)
        end
  end
  
  # GET /Link/{1}
  def open
    System.open_url(@params["link"])
  end

  # GET /Link/new
  def new
    @link = Link.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Link/{1}/edit
  def edit
    @link = Link.find(@params['id'])
    if @link
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Link/create
  def create
    @link = Link.create(@params['link'])
    redirect :action => :index
  end

  # POST /Link/{1}/update
  def update
    @link = Link.find(@params['id'])
    @link.update_attributes(@params['link']) if @link
    redirect :action => :index
  end

  # POST /Link/{1}/delete
  def delete
    @link = Link.find(@params['id'])
    @link.destroy if @link
    redirect :action => :index  
  end
end
