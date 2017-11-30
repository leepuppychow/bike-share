require 'pry'
class BikeShareApp < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations-dashboard' do
    erb :"stations/dashboard"
  end

  get '/trips' do
    @trips = Trip.all 
    erb :"trips/index"
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"/stations/edit"
  end

  set :method_override, true
  put '/stations/:id' do |id|
   Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

end
