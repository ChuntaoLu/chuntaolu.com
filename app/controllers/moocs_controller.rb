class MoocsController < ApplicationController
  before_filter :require_login, except: [:index]

  # GET /moocs
  # GET /moocs.json
  def index
    @moocs = Mooc.all.group_by { |m| m.platform }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moocs }
    end
  end

  # GET /moocs/new
  # GET /moocs/new.json
  def new
    @mooc = Mooc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mooc }
    end
  end

  # GET /moocs/1/edit
  def edit
    @mooc = Mooc.find(params[:id])
  end

  # POST /moocs
  # POST /moocs.json
  def create
    @mooc = Mooc.new(params[:mooc])

    respond_to do |format|
      if @mooc.save
        format.html { redirect_to moocs_path, notice: 'Mooc was successfully created.' }
        format.json { render json: @mooc, status: :created, location: @mooc }
      else
        format.html { render action: "new" }
        format.json { render json: @mooc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moocs/1
  # PUT /moocs/1.json
  def update
    @mooc = Mooc.find(params[:id])

    respond_to do |format|
      if @mooc.update_attributes(params[:mooc])
        format.html { redirect_to moocs_path, notice: 'Mooc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mooc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moocs/1
  # DELETE /moocs/1.json
  def destroy
    @mooc = Mooc.find(params[:id])
    @mooc.destroy

    respond_to do |format|
      format.html { redirect_to moocs_path }
      format.json { head :no_content }
    end
  end
end
