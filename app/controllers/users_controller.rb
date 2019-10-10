class UsersController < ApplicationController #allows the use of methods used in application controller
  
  get '/login' do #RENDER LOGIN FORM
    erb :login
  end

  post '/login' do 
    @user = User.find_by(email: params[:email]) #find_by expects a key, value pair

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id #logs user in
      redirect "users/#{@user.id}"
    else

    end
  end

  get '/signup' do

  end

  get '/users/:id' do #user SHOW 
    "show user page"
  end

end