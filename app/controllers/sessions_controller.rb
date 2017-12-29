class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  #this says you dont' need to be signed in, to sign in

  def new
    if signed_in?
      redirect_to current_user
    else
    end
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


  def destroy
    # when you're signed out
    session[:user_id] = nil
    # you should also be redirected
    redirect_to signin_path
  end

end
