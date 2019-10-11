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


end