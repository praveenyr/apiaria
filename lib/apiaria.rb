class Apiaria
  require './lib/roadmap.rb'
  require 'httparty'
  require 'json'
  include HTTParty
  include Roadmap
  
  base_uri "https://www.bloc.io/api/v1"
  
  attr_accessor :auth_token
  
  def initialize(email, password)
    @email = email
    @password = password
    options =  { body: { email: @email, password: @password } }
    response = self.class.post("/sessions", options)
    @auth_token = response["auth_token"]
  end
  
  def get_me
    response = self.class.get("/users/me", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
  
  def get_mentor_availability(mentor_id)
    url = "/mentors/" + mentor_id.to_s + "/student_availability"
    response = self.class.get(url,  headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
  
end
