class UsersController < ApplicationController #allows the use of methods used in application controller
  
 
  get '/login' do #RENDER LOGIN FORM
    erb :"/users/login"
  end

  post '/login' do 
    @user = User.find_by(email: params[:email]) #find_by expects a key, value pair

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id #created :user_id, logs user in
      # binding.pry
      redirect "/users/#{@user.id}"
    else
      redirect "/"
    end
  end

  get '/signup' do #RENDER SIGNUP FORM
    erb :"/users/signup"
  end

  post '/users' do

    if params_empty?
      @user = User.create(params)
      session[:user_id] = @user.id

      
      redirect "/users/#{@user.id}"
      else
        #need message telling the user what is wrong
        redirect '/users/signup'
    end
  end

  get '/users/:id' do #RENDER USER SHOW PAGE
    @user = User.find_by(id: params[:id])
    erb :"/users/show"
  end


  get '/logout' do 
    session.clear
    redirect '/'
  end

end