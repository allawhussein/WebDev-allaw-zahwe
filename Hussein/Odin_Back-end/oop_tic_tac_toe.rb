class TicTacToe
    def initialize()
        @game_status = ("1".."9").to_a
    end
    def draw_board()
        for i in [0, 3, 6]
            for j in (1..3).to_a
                print " #{@game_status[i+j-1]} |"
            end
            puts "\n---+---+---+"
        end
    end
    def get_move(player)
        move = 9
        while move == 9
            move = gets.chomp
            if @game_status[move.to_i - 1] == move
                @game_status[move.to_i - 1] = player
            else
                move = 9
                puts "invalid move"
            end
        end
    end
    def check_winner(player)
        for i in [0, 3, 6]
            if @game_status[i] == @game_status[i+1]
                if @game_status[i+2] == @game_status[i+1]
                    return player
                end
            end
        end
        
        for i in (0..2).to_a
            if @game_status[i] == @game_status[i+3]
                if @game_status[i+3] == @game_status[i+6]
                    return player
                end
            end
        end

        if @game_status[0] == @game_status[4]
            if @game_status[4] == @game_status[8]
                return player
            end
        end

        if @game_status[2] == @game_status[4]
            if @game_status[4] == @game_status[6]
                return player
            end
        end

        return "none"
    end
    def toogle_player (player)
        if player == "X"
            return "O"
        elsif player == "O"
            return "X"
        end
    end
    def check_tie()
        @game_status.each do |tile|
            if tile != "X" and tile != "O"
                return true
            end
        end
        false
    end
end

game = TicTacToe.new
winner = "none"
player = "X"
while (winner == "none" and game.check_tie())
    game.draw_board()
    game.get_move(player)
    winner = game.check_winner(player)
    puts "#{winner}"
    if winner == "none"
        player = game.toogle_player(player)
    end
end

if game.check_tie() or winner != "none"
    puts "#{player} Player won"
else
    puts "Draw"
end
game.draw_board()