class TopController < ApplicationController
protect_from_forgery

def main
    
    if session[:login_uid]
       session[:login_pass]
        
        render "main"
    else 
        
        render  "login" 
         
    end
end



def login 



#hasued_pssswword1 == "$2a$12$zYMQqRN87CddV6HyESDGlOy5HjrkZE6Q.eZNHfUdj4GSU4VqvB.mO"
#hasued_pssswword1 == "$2a$12$2c9bCI20bmUZkcmzH9x01emAnMhG8npi8c9N9X4WaMt58WUzL9WYW"
#hasued_pssswword3 == "$2a$12$ltPoTdg5eWenKHMjH9Xh3u2XltJ3ngweswOJM6/USMvMGUzI.ogm."

user_pass = BCrypt::Password.create("naha")
    if params[:uid] =="okinawa" and  BCrypt::Password.new(user_pass) == params[:pass]
        session[:login_uid] = params[:uid]
        session[:login_pass] = params[:pass]
        redirect_to root_path
        
    else 
        render 'error'
    
    end
end

def logout
    session.delete(:login_uid)
    session[:login_pass] = params[:pass]
    redirect_to root_path
end


end
