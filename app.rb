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
    { title: "新宿区", latitude: "35.68944", longitude: "139.69167", memo: "東京の県庁所在地です" },
    { title: "札幌市", latitude: "40.82444", longitude: "140.74", memo: "雪まつりの会場です" },
    { title: "大阪市", latitude: "34.68639", longitude: "135.52", memo: "たこやき食べたい" },
    { title: "福岡市", latitude: "33.60639", longitude: "130.41806", memo: "博多どんたくがあります" }
  ]
end



