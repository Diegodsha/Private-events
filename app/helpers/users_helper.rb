module UsersHelper
  

    def signed_in_user
        render partial: 'partialssigned_in_user' if session[:email]
        
    end
    
    
end
