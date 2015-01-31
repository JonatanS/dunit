class BeamsController < ApplicationController
  before_action :set_beam, only: [:show, :edit, :update, :destroy]

  # GET /beams
  # GET /beams.json
  def index
    @beams = Beam.all
  end

  # GET /beams/1
  # GET /beams/1.json
  def show
  end

  # GET /beams/new
  def new
    @beam = Beam.new
  end

  # GET /beams/1/edit
  def edit
  end

  # POST /beams
  # POST /beams.json
  def create
    @beam = Beam.new(beam_params)

    respond_to do |format|
      if @beam.save
        format.html { redirect_to @beam, notice: 'Beam was successfully created.' }
        format.json { render :show, status: :created, location: @beam }
      else
        format.html { render :new }
        format.json { render json: @beam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beams/1
  # PATCH/PUT /beams/1.json
  def update
    respond_to do |format|
      if @beam.update(beam_params)
        format.html { redirect_to @beam, notice: 'Beam was successfully updated.' }
        format.json { render :show, status: :ok, location: @beam }
      else
        format.html { render :edit }
        format.json { render json: @beam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beams/1
  # DELETE /beams/1.json
  def destroy
    @beam.destroy
    respond_to do |format|
      format.html { redirect_to beams_url, notice: 'Beam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beam
      @beam = Beam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beam_params
      params.require(:beam).permit(:revit_id, :done, :details, :section, :material, :angle)
    end
end
