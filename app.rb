require 'sinatra'
require 'active_support/core_ext'
require 'json'
require 'uri'
require 'open-uri'

configure do
  enable :sessions
end

get '/' do
  q = URI.encode_www_form_component(params[:q] || "新宿区")
  uri =  "https://nominatim.openstreetmap.org/search/#{q}?#{paramators}"
  data = JSON.parse URI.open(uri).read, { symbolize_names:  true }
  data = data.first
  if !data.present?
    @title = "場所が見つかりません"
    @latitude = 0
    @longitude = 0
  elsif params[:q]
    @title = params[:q]
    @latitude = data[:lat].to_f
    @longitude = data[:lon].to_f
  end
  erb :index
end

post '/' do
  location = params[:location].split(',')
  @selected = params[:selected]
  @title = params[:title]
  @latitude = location[0].to_f
  @longitude = location[1].to_f
  erb :index
end

private

def paramators
  { format: "json",
    polygon: 0,
    addressdatails: 1
  }.to_query
end



