class String
    def black;          "\e[30m#{self}\e[0m" end
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def brown;          "\e[33m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    def magenta;        "\e[35m#{self}\e[0m" end
    def cyan;           "\e[36m#{self}\e[0m" end
    def gray;           "\e[37m#{self}\e[0m" end

    def bg_black;       "\e[40m#{self}\e[0m" end
    def bg_red;         "\e[41m#{self}\e[0m" end
    def bg_green;       "\e[42m#{self}\e[0m" end
    def bg_brown;       "\e[43m#{self}\e[0m" end
    def bg_blue;        "\e[44m#{self}\e[0m" end
    def bg_magenta;     "\e[45m#{self}\e[0m" end
    def bg_cyan;        "\e[46m#{self}\e[0m" end
    def bg_gray;        "\e[47m#{self}\e[0m" end

    def bold;           "\e[1m#{self}\e[22m" end
    def italic;         "\e[3m#{self}\e[23m" end
    def underline;      "\e[4m#{self}\e[24m" end
    def blink;          "\e[5m#{self}\e[25m" end
    def reverse_color;  "\e[7m#{self}\e[27m" end
end

class MasterMind
    attr_reader :color_code
    attr_reader :color_palette
    attr_reader :user_code
    attr_reader :number_of_colors
    attr_reader :number_of_guesses
    attr_reader :turns

    def initialize(turns = 12, number_of_colors = 6, number_of_guesses = 4)
        @turns = turns
        @number_of_colors = number_of_colors
        @number_of_guesses = number_of_guesses
        @color_palette = ["red", "green", "blue", "magenta", "cyan", "gray", "black", "brown"]
        @color_code = []
        @user_color_guess = 0
        @user_place_guess = 0
    end
    def generate_code
        temp_color_palette = @color_palette
        for x in (1..@number_of_guesses).to_a
            temp_color = temp_color_palette.sample
            @color_code.push(temp_color)
            temp_color_palette.delete(temp_color)
        end
    end
    def take_input
        @user_code = []
        for x in (1..@number_of_guesses)
            @user_code.push(gets.chomp)
        end
        @turns -= 1
        @user_code
    end
    def validate_input(user_code = @user_code)
        @user_color_guess = 0
        @user_place_guess = 0
        user_code.each_with_index do |temp_color, index|
            if @color_code.include?(temp_color)
                @user_color_guess += 1
                if user_code.slice(0, index).include?(temp_color) and user_code.slice(0, index).length < 1
                    @user_color_guess -= 1
                end
                if color_code[index] == temp_color
                    @user_place_guess += 1
                end
            end
        end
        [@user_color_guess, @user_place_guess]
    end

end

game = MasterMind.new()
puts "guess 4 color out of this palette #{game.color_palette}"
game.generate_code()
guess = [0, 0]
puts "#{game.color_code}"
while guess[1] < game.number_of_guesses and game.turns > 0
    game.take_input
    guess = game.validate_input()
    puts "you have #{guess[0]} correct colors"
    puts "you have #{guess[1]} correct colors in correct places"
    puts "you have #{game.turns} left"
end

if guess[1] == game.number_of_guesses
    puts "YOU WON!"
elsif game.turns == 0
    puts "YOU LOST!"
else
    puts "some thing wrong happened"
end

puts "#{game.color_code}"