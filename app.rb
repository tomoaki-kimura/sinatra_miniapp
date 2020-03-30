require 'sinatra'
enable :sessions

get '/' do
  @places = place_data
  index = params[:index] ? params[:index].to_i : 0
  data = @places[index]
  @title = data ? data[:title] : ''
  @latitude = data ? data[:latitude].to_f : '0.0'
  @longitude = data ? data[:longitude].to_f : '0.0'
  @memo = data ? data[:memo] : ''
  erb :index
end

post '/' do
  #ここに投稿するコードを書きます
end

post '/delete' do
  #ここに削するコードを書きます
end

private

def place_data
  session[:place_data] || session[:place_data] = []
end

def clear_place_data
  session[:place_data] = []
end



