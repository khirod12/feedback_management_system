class StaticPagesController < ApplicationController
  def home
    @feedback=Feedback.all
    @user=User.all
    @comment=Comment.all
  end

  def help
  end

  def login
  end

  def admin
  end

  def comments
  end
  def signup
    @user=User.new
  end
end
