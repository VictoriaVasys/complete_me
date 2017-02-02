
class Node
  attr_accessor :children, :weight, :word, :start_node
  attr_reader :value, :string

  def initialize(value)
    @children = {}
    @value = value
    @weight = 0
    @word = false
  end

  def insert(word)
    first_letter = word[0]
    rest_of_word = word[1..-1]
    # check to see if the letter already exists as a child of the current node & if yes, start insert over again with the rest of the word
    unless children[first_letter]
      children[first_letter] = Node.new(first_letter)
    end
    if rest_of_word.length.zero?
      @children[first_letter].word = true
    else
      children[first_letter].insert(rest_of_word) 
    end
    # if not, create a new child node with letter as the key & start insert over again with the rest of the word
  end

  def find_node(string)
    # proceed down the trie based on the string given (if the first letter exists in the child, move to that child) until the last letter of the string
    # at that parent, search down each child node until you get to word = true; populate a return array of words by entering the string + letter + letter + etc. for each sibling
    key = string[0]
    rest_of_string = string[1..-1]
    
    if rest_of_string.empty?
      @start_node = self.children
      children_suggest(start_node)
    else
      children[key].find_node(rest_of_string)
    end

  end

  def children_suggest(current_node)
    # The following works for one letter words under the root node:
    # suggested_words += children.select{|letter, child| child.word == true}.keys
    require "pry"; binding.pry
    child_suggestions = []
    while children
      suggested_words += children.select{|letter, child| child.word == true}.keys
      children.map do |letter, child|
        child_suggestions += letter + child.value
        child.children_suggest(child.children)
      end
    end
    child_suggestions.map do |word|
      full_word = @@string + word
      suggested_words += full_word
    end
    suggested_words
  end

    # if rest_of_string == 0
    #   # retrieve all children, children's children, etc. until children.word is true for all branches (stop if children.value?(true)
    #  if node_children.word == true
    #    suggested_words << first_letter + 
    #  end

end
      
