require_relative "./node"

class CompleteMe
  attr_reader :root, :string
  attr_accessor :count

  def initialize
    @root = Node.new("")
    @count = 0
  end

  def insert(word)
    @root.insert(word)
    @count += 1
  end

  def populate(string)
      words = string.split(%r{\n})
      words.each {|word| insert(word)}
  end

  def suggest(string)
    @root.suggest(string)
    @@string = string
  end

end
