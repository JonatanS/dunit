class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = if params[:project_id]
      Project.find(params[:project_id]).memberships
    else
      Membership.all
    end
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
  end

  def request_membership
    @project = Project.find params[:project_id]
    Membership.create :project => @project, :user => current_user
    redirect_to root_url, :notice => 'Access has been requested.'
  end

  def approve
    @membership = Membership.find params[:id]
    @membership.update_attribute :approved, true
    redirect_to project_memberships_path(@membership.project)
  end

  # POST /memberships
  # POST /memberships.json
  def create
    if params[:email].present?
      @user = User.new :email => params[:email]
      @user.generate_random_password
      @user.save
      params[:membership][:user_id] = @user.id
      @membership = Membership.new(membership_params)
      Administration.invite(@user).deliver
      Rails.logger.info "Generated password: #{@user.password}"
    else
      @membership = Membership.new(membership_params)
    end

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: 'An invitation has been sent.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:project_id, :user_id)
    end
end
