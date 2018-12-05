SimpleTokenAuthentication.configure do |config|
  # Configure the session persistence policy after a successful sign in,
  # in other words, if the authentication token acts as a signin token.
  # If true, user is stored in the session and the authentication token and
  # email may be provided only once.
  # If false, users must provide their authentication token and email or record_key (Eg: username) at every request.
  # If false, users must provide their authentication token and email at every request.
  # config.sign_in_token = false
  #
  #
  # Set the record key to find a user. Default is :email
  # config.record_key = :email
  #
  #
  # Set if the value for record key is case insensitive or not. Default is false.
  # Example: abc@example.com != Abc@example.com
  #           when case_insensitive_key is set to false
  # config.case_insensitive_key = false
  #
  #
  #

  # Configure the name of the HTTP headers watched for authentication.
  #
  # Default header names for a given token authenticatable entity follow the pattern:
  #   { entity: { authentication_token: 'X-Entity-Token', email: 'X-Entity-Email'} }
  #
  # When several token authenticatable models are defined, custom header names
  # can be specified for none, any, or all of them.
  #
  # Examples
  #
  #   Given User and SuperAdmin are token authenticatable,
  #   When the following configuration is used:
  #     `config.header_names = { super_admin: { authentication_token: 'X-Admin-Auth-Token' } }`
  #   Then the token authentification handler for User watches the following headers:
  #     `X-User-Token, X-User-Email`
  #   And the token authentification handler for SuperAdmin watches the following headers:
  #     `X-Admin-Auth-Token, X-SuperAdmin-Email`
  #
  config.header_names = { user: { authentication_token: 'X-User-Token', email: 'X-User-Email' } }
  #
  # You can change header names the user key from email to username for example.
  # Example:
  #    config.header_names = { user: { authentication_token: 'X-User-Token', username: 'X-User-Username' } }
  #
  #
  #
  #

  # Configure the Devise trackable strategy integration.
  #
  # If true, tracking is disabled for token authentication: signing in through
  # token authentication won't modify the Devise trackable statistics.
  #
  # If false, given Devise trackable is configured for the relevant model,
  # then signing in through token authentication will be tracked as any other sign in.
  #
  # config.skip_devise_trackable = true
  #
end
