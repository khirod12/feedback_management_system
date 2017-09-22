class Api::V1::FeedbacksController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_feedback, only: [:show, :update, :destroy]

  # GET /feedbacks
  def index
    @feedbacks = Feedback.all

    render json: @feedbacks
  end

  # GET /feedbacks/1
  def show
    render json: @feedback
  end

  # POST /feedbacks
  def create
    @user=User.find_by_email(feedback_params[:email])
    @feedback = Feedback.new(feedback_params)

    @feedback.user_id=@user.id
    if @feedback.save
      render json: 'success'
    else
      render json: 'failed'
    end
  end

  # PATCH/PUT /feedbacks/1
  def update
    if @feedback.update(feedback_params)
      render json: @feedback
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  # DELETE /feedbacks/1
  def destroy
    @feedback.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit(:project_name, :app_name, :app_comp, :feedback_title, :feedback_desc, :screenshot,:email)
    end
end
