class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = if params[:project_id]
      Project.find(params[:project_id]).comments
    elsif params[:room_id]
      Room.find(params[:room_id]).comments
    elsif params[:floor_id]
      Floor.find(params[:floor_id]).comments
    elsif params[:foundation_id]
      Foundation.find(params[:foundation_id]).comments
    elsif params[:wall_id]
      Wall.find(params[:wall_id]).comments
    elsif params[:brace_id]
      Brace.find(params[:brace_id]).comments
    elsif params[:beam_id]
      Beam.find(params[:beam_id]).comments
    elsif params[:column_id]
      Column.find(params[:column_id]).comments
    else
      Comment.all
    end

    respond_to do |format|
      format.html
      format.json { render :text => Comment.export_formatted_json(@comments) }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
        format.js   { render :nothing => true }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:message, :user_id, :subject_type, :subject_id, :hidden, :resolved)
    end
end
