class Application 
  
  @@items = [Item.new("Fig",3),Item.new("Pear",1)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{ |i| i.name == item_name }
      resp.write "#{item.price}" 
    else 
      resp.write "Route not found"
      resp.status = 404 
    end
    
    resp.finish
  end
  
end