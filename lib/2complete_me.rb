require "pry"

class CompleteMe
  attr_reader :trie_node
  attr_accessor :count

  def initialize
    @dictionary = []
    @count = 0
    @trie_node = Node.new
  end

# want to build a trie by inserting letters from every word in the dictionary 
# each proceeding letter creates a new node into a generation down unless the letter already exists in that generation
# stop creating nodes when the word is complete (node.next.nil?)

  def insert(word, current = trie_node)
    first_letter = word[0]
    rest_of_letters = word[1..-1]
    node = nil
    found = false

    @count += 1
  end

  def find_first_matching_node(current_node, first_letter)
    current_node.children.each_with_index do |child, index|
      if first_letter == child.node
      end
    end
  end
end


class Node
  attr_reader :node
  attr_accessor :parent, :children, 
  
  def initialize(node = nil)
    @node = node
    @parent = nil
    @children = []
    @complete_word = false
    @weight = 0
  end
end


# create a Node class that reads in a letter and 



# NON-TRIE CODE
# class CompleteMe
#   attr_reader :dictionary, :count, :alphabet, :suggested_words

#   def initialize
#     @dictionary = []
#     @count = 0
#     @alphabet = [*('a'..'z')]
#   end

#   def insert(word)
#     dictionary << word
#   end

#   def count
#     dictionary.count
#   end

#   def populate(string)
#     words = string.split(%r{\n})
#     words.each {|word| dictionary << word}
#   end

#   def suggest(string)
#     @suggested_words = []
#     dictionary.each do |word|
#       if word.index(string) == 0
#         suggested_words << word
#       end
#     end
#     suggested_words
#   end

    
#     # string_length = string.length
#     # letters = string.split(%r{\s*})
#     # dictionary.each do |word|
#     #   dictionary_letters = word.split(%r{\s*})
#     #   string_length.times do |letters_index|
#     #     if letters[letters_index]
#           # end
      
#     #     if dictionary_letters[letters_index] == letters[letters_index]
#     #       suggested_words << word
#       #   end
#       # end


#   def select
#   end


# end

