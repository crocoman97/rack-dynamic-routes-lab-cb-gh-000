class Application 
  
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/")
      item = @@items.find{ |i| i.name == item_name }
      resp.write "it will cost you #{item.price}$" 
    else 
      resp.write "page not found"
      resp.status = 404 
    end
    
    resp.finish
  end
  
end