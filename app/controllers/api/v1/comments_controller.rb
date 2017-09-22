class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments.to_json(:include=>:user)
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @user=User.find(comment_params[:user_id])
    @feedback=Feedback.find(comment_params[:feedback_id])
    @comment = Comment.new(comment_params)

    @comment.user_id=@user.id
    @comment.feedback_id=@feedback.id

    if @comment.save
      render json: 'success'
    else
      render json: 'failed'
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:comment_text, :vote_count, :feedback_id, :user_id)
    end
end
