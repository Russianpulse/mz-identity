require 'sinatra'
require 'omniauth'
require 'omniauth-vkontakte'


class Server < Sinatra::Base
  use Rack::Session::Cookie
  use OmniAuth::Builder do
    provider :vkontakte, ENV['VK_API_KEY'], ENV['VK_API_SECRET'],
      {
        scope:      'friends,audio',
        display:    'popup',
        lang:       'en',
        image_size: 'original'
      }
  end

  get '/' do
    <<-HTML
      <a href='/auth/vkontakte'>Sign in with VK</a>
    HTML
  end

  get '/auth/:provider/callback' do
    content_type 'text/plain'
    request.env['omniauth.auth'].info.to_hash.inspect
  end
end
