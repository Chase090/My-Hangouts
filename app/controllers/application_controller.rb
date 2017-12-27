class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #to implement later:
  #before_action :authorized

  #helper methods are available in Views
  helper_method :logged_in?, :current_user_id



  #BEFORE any of the below come into play,  session[:user_id] has already been established, via an action in the SessionsController (which is triggered by visiting root signin page & submitting username/pw)
  def current_user_id #use this method to return the appropriate User id
    if session[:user_id]
      session[:user_id]
    #we are taught to use user_id -- why can't we go straight for the user object?
   else # i.e. no one is logged_in - you get nothing back
    end
  end


  def logged_in?  #turns current_user_id into a "does this exist"?
     !!current_user_id
     #returns T if current_user isn't nil, returns F if it is nil
  end


  # def authorized
  #   #b/c this is in the application controller, and we have the line "before_action :authorized" -- this means before ANY controller action starts, this method will be triggered
  #   #this method either does nothing (no gates put up), or if there is no user/ they are not logged in, then will send them to login page
  #   redirect_to login_path unless logged_in?
  # end

end
