class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user

  private
    def current_user_session
      return( @current_user_session ) if( defined?( @current_user_session ) )
      @current_user_session = UserSession.find
    end

    def current_user
      return( @current_user ) if( defined?( @current_user ) )
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless( current_user )
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to 'user_sessions#new'
        return false
      end
    end

    def store_location
      if( request.get? )
        session[:return_to] = request.request_uri
      elsif( !request.xhr? )
        session[:return_to] = request.referer
      end
    end

    def redirect_back_or_default( default )
      redirect_to( session[:return_to] || default )
      session[:return_to] = nil
    end
end
