Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook, "559426714147437", "1f66f08a6957b872de20a37995bd1410", {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  #provider :facebook, [559426714147437], ["1f66f08a6957b872de20a37995bd1410"]
 
  # If you want to also configure for additional login services, they would be configured here.
end