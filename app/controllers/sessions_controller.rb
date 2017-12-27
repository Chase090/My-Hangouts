class SessionsController < ApplicationController

  def new
  end

  def create
    #this method is triggered upon submitting username/pw. It sets this user as session user

    @user = User.find_by(username: params[:username].downcase)
    if @user == nil || !@user.authenticate(params[:password])
      flash[:error] = "Oops - username and/or password incorrect - please try again."
      redirect_to signin_path
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

end
