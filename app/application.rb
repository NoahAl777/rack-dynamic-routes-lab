class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/) #checks if requested path matches parentesis
      item_name = req.path.split("/items/").last #splits at /items/ and returns word after
      if item = @@items.find{|i| i.name == item_name} #if query equals return of line above
      resp.write item.price #respond with items price
      else
      resp.status = 400
      resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish 
end
end