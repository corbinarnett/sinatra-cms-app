class UsersController < ApplicationController #allows the use of methods used in application controller
  
  get '/user/login' do #RENDER LOGIN FORM
    erb :"user/login"
  end

  get '/user/signup' do

  end

end