module SessionsHelper


    # Logs in the given user.
    def log_in(user)
      session[:user_id] = user.id
    end

    # Returns the current logged-in user (if any).
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end

    end


  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

# Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
    
  end

    def authorized?
     if !logged_in?
       flash[:errors] = ["you are not logged in"]
       redirect_to login_path and return  # double redirect safeguard
     end
   end

   def authorized_for(target_user_id)
     if current_user.id != target_user_id.to_i && current_user.admin != true
       flash[:errors] = ["You cannot view a page that does not belong to you!"]
       redirect_to items_path
     end
   end



end
