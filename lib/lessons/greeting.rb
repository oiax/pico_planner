class Greeting
  def hello
    puts self.message
  end

  private def message
    'Hello'
  end
end

g = Greeting.new
g.hello
puts g.message
