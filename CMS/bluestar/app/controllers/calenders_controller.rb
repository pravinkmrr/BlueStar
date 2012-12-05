class CalendersController < ApplicationController
  # GET /calenders
  # GET /calenders.json
  def index
    @calenders = Calender.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calenders }
    end
  end

  # GET /calenders/1
  # GET /calenders/1.json
  def show
    @calender = Calender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calender }
    end
  end

  # GET /calenders/new
  # GET /calenders/new.json
  def new
    @calender = Calender.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calender }
    end
  end

  # GET /calenders/1/edit
  def edit
    @calender = Calender.find(params[:id])
  end

  # POST /calenders
  # POST /calenders.json
  def create
    @calender = Calender.new(params[:calender])

    respond_to do |format|
      if @calender.save
        format.html { redirect_to @calender, notice: 'Calender was successfully created.' }
        format.json { render json: @calender, status: :created, location: @calender }
      else
        format.html { render action: "new" }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calenders/1
  # PUT /calenders/1.json
  def update
    @calender = Calender.find(params[:id])

    respond_to do |format|
      if @calender.update_attributes(params[:calender])
        format.html { redirect_to @calender, notice: 'Calender was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calenders/1
  # DELETE /calenders/1.json
  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy

    respond_to do |format|
      format.html { redirect_to calenders_url }
      format.json { head :no_content }
    end
  end
end
