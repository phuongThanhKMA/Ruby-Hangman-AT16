class Word
    require_relative 'display.rb'
    require_relative 'random_word'
  
    attr_reader :incorrect_guesses, :correct_guesses, :lives, :display
  
    def initialize(word=RandomWord.new.pick_random_word, lives=8, display=Display.new)  
      @word = word
      puts "hi #{@word}"
      @incorrect_guesses = []
      @correct_guesses = ["_"] * @word.length
      @lives = lives
      @display = display
    end
  
    def add_guess(letter)
      if @incorrect_guesses.include?(letter) || @correct_guesses.include?(letter)
        print %Q(
          Already guessed, please try again.
          Incorrect guesses: #{display_incorrect_guesses}
          Correct guesses: #{display_correct_guesses})
      elsif letter.length != 1 || !letter.match?(/\A[a-zA-Z'-]*\z/)
        print %Q(
          Please enter a single letter (a-z).
          Incorrect guesses: #{display_incorrect_guesses}
          Correct guesses: #{display_correct_guesses})
      elsif @word.include?(letter)
        add_correct_guess(letter)
        if !solved?
          print %Q(
          That's correct!
          Here are your correct guesses: #{display_correct_guesses})
        end
      else
        add_incorrect_guess(letter)
        @lives -= 1
        @plural_lives = ""
        @lives == 1 ? @plural_lives = "guess" : @plural_lives = "guesses"
        @display.hanged_man(@lives)
        print %Q(
          You have #{@lives} #{@plural_lives} left.
          Here are your incorrect guesses: #{display_incorrect_guesses}
          Here are your correct guesses: #{display_correct_guesses})
      end
    end
  
    def display_incorrect_guesses
      @incorrect_guesses.join(" ")
    end
  
    def display_correct_guesses
      @correct_guesses.join(" ")
    end
  
    def print_correct_guesses
      puts "\tYour word is #{@word.size} characters long"
      print %Q(
          #{@correct_guesses.join(" ")})
    end
  
    def show_answer  
      puts "\tThe word was actually: #{@word}"
    end
  
    def solved?
      @word == correct_guesses.join("")
    end
  
  
    private
  
    def add_correct_guess(letter)
      @word.split("").each_with_index do |character, position|
        if letter == character
          @correct_guesses[position] = letter
        end
      end
    end
  
    def add_incorrect_guess(letter)
      @incorrect_guesses.push(letter)
    end

  end