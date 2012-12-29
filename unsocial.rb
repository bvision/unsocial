require 'sinatra'
require 'rack-canonical-host'

use Rack::CanonicalHost, 'bsocial.b-vision.com' if production?

get '/' do
  redirect to('http://bits.bvision.com/'), 301
end

get '/robots.txt' do
  erb :robots, layout: false, content_type: :txt
end

get '/sitemap.xml' do
  builder :sitemap
end

not_found do
  erb :not_found
end
