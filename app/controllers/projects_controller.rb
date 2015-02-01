class ProjectsController < ApplicationController
  protect_from_forgery except: :create
  before_action :find_auth_token, only: :create
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  def expose_element
    @floor = Floor.find_by_revit_id params[:revit_id]
    @wall = Wall.find_by_revit_id params[:revit_id]
    @column = Column.find_by_revit_id params[:revit_id]
    @brace = Brace.find_by_revit_id params[:revit_id]
    @beam = Beam.find_by_revit_id params[:revit_id]
    @foundation = Foundation.find_by_revit_id params[:revit_id]
    @room = Room.find_by_revit_id params[:revit_id]
    result = [@floor, @wall, @column, @brace, @beam, @foundation, @room].compact.first
    render :json => result.to_json
  end

  def viewer
    render :layout => nil
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        @project.memberships.create :user => current_user
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_auth_token
      return true if params[:authenticity_token].present?
      if params[:authentication_token].present?
        @user = User.find_by_authentication_token params[:authentication_token]
        sign_in @user
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :payload)
    end
end
