require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AgendaController < Rho::RhoController
  include BrowserHelper

  # GET /Agenda
  def index
    cond1 = {
            :conditions => { 
              {
                :name => 'event_id', 
                :op => '='
              } => $event_id
            }   
          }
    @agendas = Agenda.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['name','filename'])
    render :back => '/app'
  end

  # GET /Agenda/{1}
  def show
    @agenda = Agenda.find(@params['id'])
    if @agenda
          System.open_url(Rho::RhoApplication::get_blob_path(@agenda.filename)) 
    else
          redirect :action => :index
    end
  end

  # GET /Agenda/new
  def new
    @agenda = Agenda.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Agenda/{1}/edit
  def edit
    @agenda = Agenda.find(@params['id'])
    if @agenda
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Agenda/create
  def create
    @agenda = Agenda.create(@params['agenda'])
    redirect :action => :index
  end

  # POST /Agenda/{1}/update
  def update
    @agenda = Agenda.find(@params['id'])
    @agenda.update_attributes(@params['agenda']) if @agenda
    redirect :action => :index
  end

  # POST /Agenda/{1}/delete
  def delete
    @agenda = Agenda.find(@params['id'])
    @agenda.destroy if @agenda
    redirect :action => :index  
  end
end
