class Application 
  
  @@items = [Item.new("watch", 30), Item.new("necklace", 150)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new 
    
    if req.path.match(/items/)
      name = req.split("/item/")
      item = @@items.find{ |i|
        i.name = name 
      }
    else 
      resp.write "page not found"
      resp.status 404
    end
    
    resp.finish
  end
  
end