# Omniauth::Disqus

This gem contains the Disqus strategy for OmniAuth.
To use it, you'll need to register new application for an OAuth2 API Key and Secret
on the [Disqus API Resources](http://disqus.com/api/docs/auth/).

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-disqus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-disqus

## Usage

    use OmniAuth::Builder do
      provider :disqus, ENV['DISQUS_KEY'], ENV['DISQUS_SECRET']
    end

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'disqus',
  :uid => '1234567',
  :info => {
    :name => 'disqus_api',
    :nickname => 'disqus_api',
    :urls => { :profileUrl => 'http://disqus.com/disqus_api/' },
    :location => 'a',
    :image => 'http://disqus.com/api/users/avatars/disqus_api.jpg',
    :email => 'example@disqus.com',
  },
  :credentials => {
    :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
    :refresh_token => 'ABCDEF...' # The refresh token as described in the OAuth spec.
    :expires_at => 1321747205, # when the access token expires (it always will)
    :expires => true # this will always be true
  },
  :extra => {
    :raw_info => {
    :username => 'disqus_api',
    :about => '',
    :name => 'disqus_api',
    :url => '',
    :profileUrl => 'http://disqus.com/disqus_api/',
    :emailHash => '67f79ed8e10b74abf07a8dfe101bbab2',
    :id => '1',
    :numFollowers => 0,
    :numFollowing => 0,
    :numPosts => 0,
    :rep => 1.231755,
    :reputation => 1.231755,
    :location => '',
    :isPrivate => false,
    :joinedAt => '2013-11-08T12:42:47',
    :isAnonymous => false,
    :numLikesReceived => 0,
    :email => 'example@disqus.com',
    :avatar => {
      :small => {
        :permalink => 'http://disqus.com/api/users/avatars/disqus_api.jpg',
        :cache => 'http://mediacdn.disqus.com/1091/images/noavatar32.png'
      }
      :large => {
        :permalink => 'http://disqus.com/api/users/avatars/disqus_api.jpg',
        :cache => 'http://mediacdn.disqus.com/1091/images/noavatar92.png'
      }
      :isCustom => false
      :permalink => 'http://disqus.com/api/users/avatars/disqus_api.jpg',
      :cache => 'http://mediacdn.disqus.com/1091/images/noavatar92.png'
    },
    :isAnonymous: false
    }
  }
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
