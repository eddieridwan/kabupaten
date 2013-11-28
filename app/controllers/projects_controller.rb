require 'will_paginate/array'

class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource
  before_filter :globalize_fallbacks

  # GET /projects
  # GET /projects.json
  def index
    if params[:filter]
      @filter = params[:filter]
      @kabupaten = Kabupaten.find(@filter[:kabupaten_id]) if @filter[:kabupaten_id].present?
      projects = Project.filter(@filter)
    else
      projects = Project.limit(100)
    end
    # Sort by name for the current locale, so need to use sort_by because cannot use :order.
    @projects = projects.sort_by{|p| p.name.to_s.downcase}.paginate(page: params[:page], per_page: 15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.user = current_user

    # HABTM associations
    @project.sectors = Sector.find_all_by_id(params[:sector_ids])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    # HABTM associations
    # Overwrite existing sectors. If params[:sector_ids] is nil then remove all areas.
    @project.sectors = Sector.find_all_by_id(params[:sector_ids])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
