class Application 
  
  @@items = [Item.new("watch", 30), Item.new("necklace", 150)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new 
    
    if req.path.match(/items/)
      name = req.split("/items/")
      item = @@items.find{ |i|
        i.name = name 
      }
      resp.write "it will cost you #{item.price}$" 
    else 
      resp.write "page not found"
      resp.status 404
    end
    
    resp.finish
  end
  
end