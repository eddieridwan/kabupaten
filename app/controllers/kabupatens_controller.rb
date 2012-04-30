class KabupatensController < ApplicationController
  # GET /kabupatens
  # GET /kabupatens.json
  def index
    @kabupatens = Kabupaten.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kabupatens }
    end
  end

  # GET /kabupatens/1
  # GET /kabupatens/1.json
  def show
    @kabupaten = Kabupaten.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kabupaten }
    end
  end

  # GET /kabupatens/new
  # GET /kabupatens/new.json
  def new
    @kabupaten = Kabupaten.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kabupaten }
    end
  end

  # GET /kabupatens/1/edit
  def edit
    @kabupaten = Kabupaten.find(params[:id])
  end

  # POST /kabupatens
  # POST /kabupatens.json
  def create
    @kabupaten = Kabupaten.new(params[:kabupaten])

    respond_to do |format|
      if @kabupaten.save
        format.html { redirect_to @kabupaten, notice: 'Kabupaten was successfully created.' }
        format.json { render json: @kabupaten, status: :created, location: @kabupaten }
      else
        format.html { render action: "new" }
        format.json { render json: @kabupaten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kabupatens/1
  # PUT /kabupatens/1.json
  def update
    @kabupaten = kabupaten.find(params[:id])

    respond_to do |format|
      if @kabupaten.update_attributes(params[:kabupaten])
        format.html { redirect_to @kabupaten, notice: 'kabupaten was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @kabupaten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kabupatens/1
  # DELETE /kabupatens/1.json
  def destroy
    @kabupaten = kabupaten.find(params[:id])
    @kabupaten.destroy

    respond_to do |format|
      format.html { redirect_to kabupatens_url }
      format.json { head :ok }
    end
  end
end