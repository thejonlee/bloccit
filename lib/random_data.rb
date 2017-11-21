# #5 - use module bc it is a standalone library with no dependencies or inheritance requirements
module RandomData
# #6
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

# #7 - capitalize upcases first character and downcases everything else, then we append a period
  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

# #8 - shuffle! on letters in place instead of returning an array
  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end
