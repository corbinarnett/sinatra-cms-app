require './config/environment'
# require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "DINED_123"
    # use Rack::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
    
  end

  helpers do 

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def params_empty?
      params[:name] != "" && params[:address] != "" && params[:website] != ""
    end

  end

end
