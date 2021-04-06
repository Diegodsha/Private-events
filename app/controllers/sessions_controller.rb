class SessionsController < ApplicationController
  def new
  end

  def create
    
    @user = User.find_by(email: email)

    if @user
     session[:email] = @user.email
     redirect_to root_path
    else
      redirect_to '/login'
    end

  end

  def login
  end
end
