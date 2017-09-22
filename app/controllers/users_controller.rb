class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User #{@user.email} created Successfully!"
      redirect_to '/feedbacks'
    else
      render 'new'
    end
  end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :auth_token,:password_confirmation,:user_type,:customer_name)
    end
end