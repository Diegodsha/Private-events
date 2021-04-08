class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'You are logged in succesfully'
      redirect_to root_path
    else
      flash[:alert] = 'Please enter an existing e-mail or create an account'
      redirect_to '/login'
    end
  end

  def login; end

  def destroy
    session.destroy
    flash[:notice] = 'You are logged out'
    redirect_to root_path
  end
end
