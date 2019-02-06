class Application

  @@items = ["Apples","Carrots","Pears"]

  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      search_term = req.params["q"]
      resp.write @@cart.empty? ? "Your cart is empty" : @@cart.join("\n")
    elsif req.path.match(/add/)
      item = req.params["item"]
      if @@items.include?(item)
        @@cart << item
        resp.write "added #{item}"
      else
        resp.write "We don't have that item"
      end
    else
      resp.write "Path Not Found"
    end
end
