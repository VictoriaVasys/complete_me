
class Node
  attr_accessor :children, :word, :start_node, :child_suggestions
  attr_reader :value, :string

  def initialize(value)
    @children = {}
    @value = value
    @word = false
    @child_suggestions = []
  end

  def insert(word)
    first_letter = word[0]
    rest_of_word = word[1..-1]

    unless children[first_letter]
      children[first_letter] = Node.new(first_letter)
    end

    if rest_of_word.empty?
      @children[first_letter].word = true
    else
      children[first_letter].insert(rest_of_word) 
    end
  end

  
  def suggest(string)
    find_node(string)
    
    suggested_words = []
    child_suggestions.map do |word|
      suggested_words += @@string + word
    end
    suggested_words
  end

  def find_node(string)
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
    require "pry"; binding.pry
    
    until children.empty?
      # suggested_words += children.select{|letter, child| child.word == true}.keys # will return an array of the keys (letters) that have the attribute word = true
      children.map do |letter, child|
        child_suggestions += letter + child.value #this adds ['pp']; need to figure out how to tack onto it with next chlidren
        if child.word == true
          if !children[child].empty? # not leaf node
            child_suggestions += # need to add another copy to array
          end
        end
        child.children_suggest(child.children)
      end
    end
  end

  def select(string, preference)
    suggested(string)
    suggested_words.delete(preference)
    suggested_words.unshift(preference)
    selections(string, preference)
  end

  def selections(string, preference)
    selections = {}
    if selections[string]
      selections[:string][:preference] += 1
    else 
      selections[:string] = {preference: 1}
    end
    
    selections[:string].values.sort.reverse
    suggested_words.each_with_index do |word, i|
      suggested_words.delete(i)
      suggested_words.unshift(words)
    end
    suggested_words
  end

end
      
