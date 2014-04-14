require 'omniauth/strategies/oauth2'
require 'open-uri'

module OmniAuth
  module Strategies
    class Disqus < OmniAuth::Strategies::OAuth2
      option :name, 'disqus'
      option :client_options, {
        :site => 'https://disqus.com',
        :authorize_url => '/api/oauth/2.0/authorize/?scope=read,email',
        :token_url      => '/api/oauth/2.0/access_token/'
        }
      uid { access_token.params['user_id'].to_s }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email'],
          :nickname => raw_info['username'],
          :urls => { 'profileUrl' => raw_info['profileUrl'] },
          :location => raw_info['location'],
          :image => raw_info['avatar']['small']['permalink']
        }
      end

      extra do
        { :raw_info => raw_info }
      end
      
      def raw_info
        begin
          res = JSON.parse(open("https://disqus.com/api/3.0/users/details.json?access_token=#{access_token.token}&api_key=#{access_token.client.id}").read)
        rescue => e
          e # what should be done with this?
        end
        res = Hashie::Mash.new(res.to_hash['response'])
        @raw_info ||= res
      end
    end
  end
end