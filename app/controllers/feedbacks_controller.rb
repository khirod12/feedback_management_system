class FeedbacksController < ApplicationController
  def new
    @feedback=Feedback.new
  end
  def show
    @feedback=Feedback.all
    @comment=Comment.all
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