class Display

  def initialize()
  end

  def game_rules
    print %Q(
        Welcome to Hangman!
        To win, you need to guess the mystery word or you die.
        You can have up to 8 incorrect guesses, before you're hanged.
        Let's begin!
    )
  end

  def winner
    print %Q(
        You've guessed the word correctly. You are a winner!
    )
  end

  def loser
    print %Q(
        You have run out of lives. You're dead!
        You're a loser.
        The game is over.
    )
  end

  def guess_letter
    print %Q(
        Guess a letter
        >
    )
  end

  def play_again
    print %Q(
      Guess a letter
      >
    )
  end

  def hanged_man(lives)
    case lives
    when 7
      print %Q(
      +-----+
            |
            |
            |
            |
            |
      =======)
    when 6
      print %Q(
      +-----+
      |     |
            |
            |
            |
            |
      =======)
    when 5
      print %Q(
      +-----+
      |     |
      0     |
            |
            |
            |
      =======)
    when 4
      print %Q(
      +-----+
      |     |
      0     |
      |     |
            |
            |
      =======)
    when 3
      print %Q(
      +-----+
      |     |
      0     |
     /|     |
            |
            |
      =======)
    when 2
      print %Q(
      +-----+
      |     |
      0     |
     /|\\    |
            |
            |
      =======)
    when 1
      print %Q(
      +-----+
      |     |
      0     |
     /|\\    |
       \\    |
            |
      =======)
    when 0
      print """
      +-----+
      |     |
      0     |
     /|\\    |
     / \\    |
            |
      ======="""
    end
  end

end