require 'sinatra'
require 'omniauth'


class Server < Sinatra::Base
  get '/' do
    <<-HTML
			<meta name='loginza-verification' content='9db5821c56ad8db522bf5ccba8579008' />

      <a href='/auth/vkontakte'>Sign in with VK</a>
    HTML
  end

  get '/auth/:provider/callback' do
    content_type 'text/plain'
    request.env['omniauth.auth'].info.to_hash.inspect
  end
end
