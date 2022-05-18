def stock_picker(stock_prices)
  profits = []
  # Get the best day to sell for each day
  stock_prices.each_with_index do |price, index|
    if (index + 1) == stock_prices.length
      break
    end

    sublist = stock_prices[(index + 1)..-1]
    profits.push([price, sublist.max])
  end

  # Calculate the profits
  profits_calculated = profits.map {|profit| profit.last - profit.min }
  highest_profit = profits_calculated.max

  hp_index = profits_calculated.index(highest_profit)

  # Return the indices of the best days to buy and sell
  [stock_prices.index(profits[hp_index].first), stock_prices.index(profits[hp_index].last)]
end