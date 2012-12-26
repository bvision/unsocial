require 'sinatra'

get '/' do
  redirect to('http://bits.bvision.com/'), 301
end

get '/sitemap.xml' do
  builder :sitemap
end

not_found do
  erb :not_found
end
