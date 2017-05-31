class Apiaria
  include HTTParty
  
  def initialize(email, password)
    @email = email,
    @password = password,
    @base_uri = "https://www.bloc.io/api/v1",
    @auth_token = self.class.post("https://www.bloc.io/api/v1/sessions", :body => { :email => @email, :password => @password })
  end
  
end
