require File.expand_path('../unsocial', __FILE__)
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

  def test_not_found_should_respond_with_410
    get '/xxx'
    assert_equal 410, last_response.status
  end

  def test_robots_txt_should_respond_ok
    get '/robots.txt'
    assert last_response.ok?
  end

  def test_google_verification_should_respond_ok
    get '/google3937f044695dbc67.html'
    assert last_response.ok?
  end

  def test_sitemap_xml_should_respond_ok
    get '/sitemap.xml'
    assert last_response.ok?
  end
end
