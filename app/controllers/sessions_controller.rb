class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user
     session[:user_id] = @user.id
     redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  def login
  end
end
