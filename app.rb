require 'sinatra'

get '/' do
  @places = place_data
  data = @places.first
  @title = data[:place]
  @latitude = data[:latitude]
  @longitude = data[:longitude]
  @memo = data[:memo]
  erb :index
end

post '/' do
  @places = place_data
  location = params[:location].split(',')
  @title = params[:title]
  @latitude = location[0]
  @longitude = location[1]
  @memo = location[2]
  erb :index
end

private

def place_data
  [
    #ここにデーターが入る
  ]
end



