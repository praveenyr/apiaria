module Roadmap
  def get_roadmap(roadmap_id)
    url = "/roadmaps/" + roadmap_id.to_s
    response = self.class.get(url,  headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
  
  def get_checkpoint(checkpoint_id)
    url = "/checkpoints/" + checkpoint_id.to_s
    response = self.class.get(url,  headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
end