#our goal is to write method stock_piker that takes array of stock prices and recommend best day to buy then cell
#first we will search for the lowest price, and then search for the highest price after ward
#if no price is found we search for the second lowest number and re-search for the new highest
#or we use burte-force
#we take each number compare to all others record the highest difference
#then compare the differences

def stock_piker (stock_prices)
    lowest_per_day = []
    stock_prices.each_with_index do |buy_price, buy_index|
        profit = 0
        s_index = 0
        b_index = 0
        stock_prices.each_with_index do |sell_price, sell_index|
            if sell_index > buy_index
                if (sell_price - buy_price) > profit
                    profit = sell_price - buy_price
                    s_index = sell_index
                    b_index = buy_index
                end
            end
        end
        lowest_per_day.push([b_index, s_index, profit])
    end
    puts "#{lowest_per_day}"
    profit = 0
    array = []
    lowest_per_day.each do |lowest|
        if lowest[2] > profit
            array = lowest
            profit = lowest[2]
        end
    end
    return array
end

prices = [17,3,6,9,15,8,6,1,10]
puts "#{stock_piker(prices)}"