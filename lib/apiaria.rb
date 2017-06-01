class Apiaria
  require 'httparty'
  include HTTParty
  
  base_uri "https://www.bloc.io/api/v1"
  
  attr_accessor :auth_token
  
  def initialize(email, password)
    @email = email
    @password = password
    options =  { body: { email: @email, password: @password } }
    response = self.class.post("/sessions", options)
    @auth_token = response["auth_token"]
  end
  
end
