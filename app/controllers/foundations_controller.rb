class FoundationsController < ApplicationController
  before_action :set_foundation, only: [:show, :edit, :update, :destroy]

  # GET /foundations
  # GET /foundations.json
  def index
    @foundations = Foundation.all
  end

  # GET /foundations/1
  # GET /foundations/1.json
  def show
  end

  # GET /foundations/new
  def new
    @foundation = Foundation.new
  end

  # GET /foundations/1/edit
  def edit
  end

  # POST /foundations
  # POST /foundations.json
  def create
    @foundation = Foundation.new(foundation_params)

    respond_to do |format|
      if @foundation.save
        format.html { redirect_to @foundation, notice: 'Foundation was successfully created.' }
        format.json { render :show, status: :created, location: @foundation }
      else
        format.html { render :new }
        format.json { render json: @foundation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foundations/1
  # PATCH/PUT /foundations/1.json
  def update
    respond_to do |format|
      if @foundation.update(foundation_params)
        format.html { redirect_to @foundation, notice: 'Foundation was successfully updated.' }
        format.json { render :show, status: :ok, location: @foundation }
        format.js   { render :nothing => true }
      else
        format.html { render :edit }
        format.json { render json: @foundation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foundations/1
  # DELETE /foundations/1.json
  def destroy
    @foundation.destroy
    respond_to do |format|
      format.html { redirect_to foundations_url, notice: 'Foundation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foundation
      @foundation = Foundation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foundation_params
      params.require(:foundation).permit(:revit_id, :done, :details, :material, :foundation_type, :rotation)
    end
end
