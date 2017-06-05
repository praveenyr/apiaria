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
  
  def get_messages(pageNum = nil)
    unless pageNum
      response = self.class.get("/message_threads",  headers: { "authorization" => @auth_token })
      JSON.parse(response.body)
    else
      url = "/message_threads?page=" + pageNum.to_s
      response = self.class.get(url,  headers: { "authorization" => @auth_token })
      JSON.parse(response.body)
    end
  end

  def create_message(sender, recipientId, text, subject)
    # args = {}
    # args["sender"] = sender
    # args["recipient_id"] = recipientId
    # args["token"] = options[:token] unless options[:token] == nil
    # args["subject"] = options[:subject] unless options[:subject] == nil
    # args["stripped-text"] = body
    
    # response = self.class.post("/messages", body: args.to_json, headers: { "authorization" => @auth_token } )
    # JSON.parse(response.body)
    response = self.class.post("/messages",
      body: {
          "sender": sender,
          "recipient_id": recipientId,
          "subject": subject,
          "stripped-text": text
          } ,
      headers: { "authorization" => @auth_token }
    )
    JSON.parse(response.body)
  end
  
  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
    values = {
      "assignment_branch": assignment_branch,
      "assignment_commit_link": assignment_commit_link,
      "checkpoint_id": checkpoint_id,
      "comment": comment,
      "enrollment_id": 24575,
    }
    response = self.class.post("/checkpoint_submissions", body: values, headers: { "authorization" => @auth_token } )
    JSON.parse(response.body)
  end
  
end
