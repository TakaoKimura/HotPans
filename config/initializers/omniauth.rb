Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  
  if Rails.env.development?
    # Development Enviroment. url: localhost:3000
    app_id = "481775351940477"
    app_secret = "d74e5702ec84758741a38463ddf50671"
  else
    # Production Enviroment. url: hotpans.herokuapp.com
    app_id = "559426714147437"
    app_secret = "1f66f08a6957b872de20a37995bd1410"
  end
  
  provider :facebook, app_id, app_secret, {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
 
  # If you want to also configure for additional login services, they would be configured here.
end
