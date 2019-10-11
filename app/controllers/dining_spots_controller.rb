class DiningSpotsController < ApplicationController
  
  get '/dining_spots/new' do 
    erb :"/dining_spots/new"
  end

  post '/dining_spots' do
    if !logged_in?
      redirect '/'
    end

    if params[:name] != "" && params[:address] != "" && params[:website] != ""
      @dining_spot = DiningSpot.create(name: params[:name], address: params[:address], website: params[:website], user_id: current_user.id)
      redirect "/dining_spots/#{@dining_spot.id}"
    else
      redirect "/dining_spots/new"
    end
  end

  get '/dining_spots/:id' do 
    @dining_spot = DiningSpot.find_by(id: params[:id])
    erb :"/dining_spots/show"  #redirects destroy instance variables
  end

  get '/dining_spots/:id/edit' do
    "Hello World"

    erb :"/dining_spots/edit"
  end
  
end