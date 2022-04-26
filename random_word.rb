class RandomWord
  def initialize
    #  print("Enter a dictionary file name: ")
    #  filename = gets.chomp()  
    filename = File.open('GK\dictionary.txt')
    word_list = File.readlines(filename)
    @index = word_list.shuffle!

  end

  def pick_random_word
    @words=@index.sample.strip
  end
end
