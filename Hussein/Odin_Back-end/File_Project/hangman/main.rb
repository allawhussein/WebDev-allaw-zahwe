class HangmanGame
    attr_reader :user_guess
    attr_reader :left_guesses

    attr_accessor :win_or_lose

    def initialize (number_of_letters = 6)
        @user_guess = Array.new number_of_letters, '-'
        code_list = generate_code(number_of_letters)
        @random_code = code_list[rand(code_list.length)]
        @left_guesses = 11
        @win_or_lose = false
    end
    def generate_code(number_of_letters)
        code_file = File.open "game_data/5desk.txt"
        code_list = []

        while !code_file.eof?
            temp_code = code_file.gets.chomp.downcase
            if temp_code.length == 6
                code_list.push(temp_code)
            end
        end
        code_list
    end
    def take_n_validate (letter)
        @random_code.split("").each_with_index do |char, index|
            @user_guess[index] = char if char == letter
        end
        @left_guesses -= 1
        @user_guess
    end
    def hang_em
        temp_hang = File.read "resources/"+(11-@left_guesses).to_s+"hangman_stage.txt"
    end
    def save_game
        game_file = File.new "game_data/game_save", "w"
        game_file.puts @left_guesses
        game_file.puts @random_code
        game_file.puts @user_guess.join("")
        game_file.close
    end
    def load_game
        begin
            game_file = File.open "game_data/game_save", "r"
            @left_guesses = game_file.gets.chomp.to_i
            @random_code = game_file.gets.chomp
            @user_guess = game_file.gets.chomp.split("")
            "game loaded successfully"
        rescue Errno::ENOENT
            "no saved game"
        end
    end
    def check_win
        if @user_guess.join("") == @random_code
            win_or_lose = true
        else
            win_or_lose = false
        end
    end
end

game = HangmanGame.new(5)
puts "start a new game or load an old one?[N/O]"
option = gets.chomp

begin
    while option != 'N' and option != 'O' and option != 'n' and option != 'o'
        puts "invalid option"
        option = gets.chomp
    end

    if option == 'O' or option == 'o'
        game.load_game
    end

    while game.left_guesses > 0
        puts "your guess #{game.user_guess.join(" ")}"
        puts game.hang_em
        if game.check_win
            break
        end
        puts "#{game.left_guesses} guesses to die"    
        game.take_n_validate gets.split("")[0]
    end

    puts "your guess #{game.user_guess.join(" ")}"
    puts game.hang_em
    if game.check_win
        puts "you are dead"
    else 
        puts "I am dead"
    end
rescue Exception => e
    puts "\nsaving"
    game.save_game
end