require 'sinatra'

get '/' do
  @latitude = 0.0
  @longitude = 0.0
  erb :index
end

post '/' do
  data = params[:prefecture].split(',')
  @latitude = data[0].to_f
  @longitude = data[1].to_f
  erb :index
end
