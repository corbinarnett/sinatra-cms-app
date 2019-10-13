class DiningSpotsController < ApplicationController
  
  get '/dining_spots' do
    @user = current_user
    redirect "/users/#{current_user.id}"
  end

  get '/dining_spots/explore' do
    @dining_spots = DiningSpot.all
    erb :"/dining_spots/index"
  end

  get '/dining_spots/new' do 
    erb :"/dining_spots/new"
  end

  post '/dining_spots' do
    if !logged_in?
      redirect '/'
    end

    if params_empty?
      @dining_spot = DiningSpot.create(name: params[:name], address: params[:address], website: params[:website], user_id: current_user.id)
      redirect "/users/#{current_user.id}"
    else
      redirect "/dining_spots/new"
    end
  end

  get '/dining_spots/:id' do 
    set_dining_spot
    erb :"/dining_spots/show"  #redirects destroy instance variables
  end

  get '/dining_spots/:id/edit' do
    # raise params.inspect
    set_dining_spot
    if logged_in?
      if @dining_spot.user == current_user
        erb :"/dining_spots/edit"
      else
        redirect "/users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end

  patch '/dining_spots/:id' do
    set_dining_spot
    if logged_in?
      if @dining_spot.user == current_user && params_empty?
        @dining_spot.update(name: params[:name], address: params[:address], website: params[:website])
        redirect "/dining_spots/#{@dining_spot.id}"
      else
        redirect "/users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end

  delete '/dining_spots/:id' do 
    set_dining_spot
    if current_user == @dining_spot.user
      @dining_spot.destroy
      redirect "/dining_spots"
    else
      redirect "/dining_spots"
    end
  end





  private

  def set_dining_spot
    @dining_spot = DiningSpot.find(params[:id])
  end
  
end