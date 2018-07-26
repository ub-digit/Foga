class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #include Error::ErrorHandler

  def current_user
    a_session = session[:user_id]
    an_user ||= User.find(a_session) if a_session 
    @current_user ||= an_user if (an_user && an_user.is_active)
   
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate
    redirect_to '/login' unless current_user
  end

   def an_admin
    redirect_to '/login' unless @current_user.is_admin
  end

end
