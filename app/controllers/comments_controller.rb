class CommentsController < ApplicationController
  def new
    @comment=Comment.new
    @feedback = Feedback.find(params[:feedback_id])
    @pre_comment=Comment.all
    @user=User.all
  end
  def show
    @comment=Comment.find(params[:id])
  end
  def create
    ## As of now we are expectin the comments through param value 
    ## One the Feedback use the controller , need to swutch ro the comment_param

    @user=User.find(params[:user_id])
    @feedback=Feedback.find(params[:feedback_id])
    @comment=Comment.new(comment_params)

    @comment.user_id=@user.id
    @comment.feedback_id=@feedback.id

    if @comment.save
      flash.now[:success] = "Your Comment Successfully posted!"
      #redirect_to '/redcomment'
      #redirect_to :controller => '/redcomment', :action => 'new',:feedback_id => @comment.feedback_id
      redirect_back fallback_location: { action: "new", feedback_id: @comment.feedback_id }
    else
      render 'new'
    end
  end

  def get_feedback
    @feedback = Feedback.find(params[:feedback_id])
  end

  def commit_like
    @user=User.find(comment_params[:user_id])
    @feedback=Feedback.find(comment_params[:feedback_id])
    @comment=Comment.new(comment_params)

    @comment.user_id=@user.id
    @comment.feedback_id=@feedback.id

## Well, I do not have a like yet to this feedback, Please give me a chance
    if @comment.save
      redirect_back fallback_location: { action: "new", feedback_id: @comment.feedback_id }      
    end
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