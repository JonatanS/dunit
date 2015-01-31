class BracesController < ApplicationController
  before_action :set_brace, only: [:show, :edit, :update, :destroy]

  # GET /braces
  # GET /braces.json
  def index
    @braces = Brace.all
  end

  # GET /braces/1
  # GET /braces/1.json
  def show
  end

  # GET /braces/new
  def new
    @brace = Brace.new
  end

  # GET /braces/1/edit
  def edit
  end

  # POST /braces
  # POST /braces.json
  def create
    @brace = Brace.new(brace_params)

    respond_to do |format|
      if @brace.save
        format.html { redirect_to @brace, notice: 'Brace was successfully created.' }
        format.json { render :show, status: :created, location: @brace }
      else
        format.html { render :new }
        format.json { render json: @brace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /braces/1
  # PATCH/PUT /braces/1.json
  def update
    respond_to do |format|
      if @brace.update(brace_params)
        format.html { redirect_to @brace, notice: 'Brace was successfully updated.' }
        format.json { render :show, status: :ok, location: @brace }
      else
        format.html { render :edit }
        format.json { render json: @brace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /braces/1
  # DELETE /braces/1.json
  def destroy
    @brace.destroy
    respond_to do |format|
      format.html { redirect_to braces_url, notice: 'Brace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brace
      @brace = Brace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brace_params
      params.require(:brace).permit(:revit_id, :done, :details, :section, :material, :angle)
    end
end
