class KabupatensController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :autocomplete_kabupaten_name]
  before_filter :globalize_fallbacks
  load_and_authorize_resource :except => [:autocomplete_kabupaten_name]

  autocomplete :kabupaten, :name, full: true


  # GET /kabupatens
  # GET /kabupatens.json
  def index
    if params[:province]
      @province = Province.find(params[:province])
      @kabupatens = Kabupaten.in_province(params[:province]).order('kabupatens.name asc').paginate(page: params[:page], per_page: 15)
    else
      @kabupatens = Kabupaten.includes(:province).order('provinces.name asc, kabupatens.name asc').paginate(page: params[:page], per_page: 15)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kabupatens }
    end
  end

  # GET /kabupatens/1
  # GET /kabupatens/1.json
  # GET /kabupatens/0?&kabupaten_name=Aceh+Barat
  def show
    if params[:name]
      @kabupaten = Kabupaten.where(id: params[:id_for_name]).first || Kabupaten.where(name: params[:name]).first
      unless @kabupaten
        flash[:error] = "No Kabupaten/Kota with name #{params[:name]}"
        redirect_to :back
        return
      end
    else
      @kabupaten = Kabupaten.find(params[:id])
    end

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
    @kabupaten = Kabupaten.find(params[:id])

    respond_to do |format|
      if @kabupaten.update_attributes(params[:kabupaten])
        format.html { redirect_to @kabupaten, notice: 'Kabupaten was successfully updated.' }
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
