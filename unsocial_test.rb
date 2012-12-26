require './unsocial.rb'
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class UnsocialTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index_should_redirect_with_301
    get '/'
    assert_equal 301, last_response.status
    assert_equal 'http://bits.bvision.com/', last_response.location
  end

  def test_not_found_should_respond_with_404
    get '/xxx'
    assert_equal 404, last_response.status
  end

  def test_robots_txt_should_respond_with_200
    get '/robots.txt'
    assert_equal 200, last_response.status
  end

  def test_google_verification_should_respond_with_200
    get '/google3937f044695dbc67.html'
    assert_equal 200, last_response.status
  end
end
