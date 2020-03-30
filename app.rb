require 'sinatra'
enable :sessions

get '/' do
  @places = place_data
  index = params[:index] ? params[:index].to_i : 0
  data = @places[index]
  p @title = data ? data[:title] : ''
  p @latitude = data ? data[:latitude].to_f : '0.0'
  p @longitude = data ? data[:longitude].to_f : '0.0'
  p @memo = data ? data[:memo] : ''
  erb :index
end

post '/' do
  @title = params[:title]
  @latitude = params[:latitude]
  @longitude = params[:longitude]
  @memo = params[:memo]
  @places = place_data << { title: @title, latitude: @latitude , longitude: @longitude, memo: @memo }
  erb :index
end

post '/delete' do
  clear_place_data
  redirect '/'
end

private

def place_data
  session[:place_data] || session[:place_data] = []
end

def clear_place_data
  session[:place_data] = []
end



