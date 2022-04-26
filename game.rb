require_relative 'display'
require_relative 'word'

class Game

  attr_reader :display, :word

  def initialize(display=Display.new, word=Word.new)
    @display = display
    @word = word

  end

  def play
      @display.game_rules
      @word.print_correct_guesses
      until @word.solved? || @word.lives == 0
        @display.guess_letter
        letter = gets.chomp.downcase
        @word.add_guess(letter)
      end

      if @word.solved?
        @display.winner
        @word.show_answer
        
      else
        @display.loser
        @word.show_answer   
      end
  end

end
