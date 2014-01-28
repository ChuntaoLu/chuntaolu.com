class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_path, notice: "Successfully logged in!"
    else
      flash.now.alert = "Email or password was invalid."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
