    class ApplicationController < ActionController::Base
      
        include SessionsHelper
        
        def set_current_user
          @current_user = User.find_by(id: session[:user.id])
        end
        
      private

    def require_user_logged_in
      unless logged_in?
        redirect_to login_url
      end
    end
    
    def counts(user)
      @count_tasks = user.tasks.count
    end
    end