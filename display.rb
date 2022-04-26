class Display
  require 'json'
  def initialize()
    @player_name = ""
    @saved_game = ""
  end

  def to_json
    JSON.generate({player_name: @player_name, point: @point})
  end

  def save_game(string) 
    File.open("saved.json", "a") do |game_file|
      game_file.write(string)
      end
    puts "Game saved!"
  end

  def winner
    print %Q(
        You've guessed the word correctly. You are a winner!
    )
    print %Q(
     What's your name?
  )
    @player_name = gets.chomp
    print %Q(
      Do you wanna save your point?
      Press 1 if you want.
    )
    @saved_game = gets.chomp
    case @saved_game
    when "1"
      @point = $lives
      save_game(to_json)
    else
      print %Q(
        Goodbye #{@player_name} Thanks for playing Hangman.
      ) 
    end

  end


  def loser
    print %Q(
        You have run out of lives. You're dead!
        You're a loser.
        The game is over.
    )
  end

  def game_rules
    print %Q(
        Welcome to Hangman!
        To win, you need to guess the mystery word or you die.
        You can have up to 8 incorrect guesses, before you're hanged.
        Let's begin!
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