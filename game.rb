require 'pry'
require './ships'
require './grid'
require './spaces'
require './player'

system "clear"
grids =[]
2.times do
  grids << Grid.new(10,10)
end

players = []
2.times do
  players << Player.new
end

row = 0
col = 0



puts "Welcome to Battleship!\n"
puts "Player 1, what is your name? \n"
  players[0].new_name(gets.chomp.capitalize)
puts "Player 2, what is your name? \n"
  players[1].new_name(gets.chomp.capitalize)

system "clear"

  2.times do |x|
  
    grids[x].display_hidden
    puts "\n#{players[x].name} time to place your ships!"
    loop do
      system "clear"
      grids[x].display_hidden
      puts "\n#{players[x].name}, would you like your Carrier to be horizontal or vertical? (h/v)"
      if gets.chomp.downcase == 'h'
        car = Carrier.new(true)
      else
        car = Carrier.new
      end

      loop do
        row, col = 0, 0
        puts "\n#{players[x].name}, which row would you like to start your ship placement from?\n"
        row = gets.chomp.to_i-1
        puts "\nAnd which column?"
        col = gets.chomp.to_i-1
        if (0..9).include?(row) && (0..9).include?(col)
          break
        end
      end

      if car.check_place(grids[x], row: row, col: col)
        car.place(grids[x], row: row, col: col)
        grids[x].display_hidden
        break
      else
        puts "Invalid placement! Try again.\n"
        sleep (1)
      end
    end

    loop do
      system "clear"
      grids[x].display_hidden
      puts "\n#{players[x].name}, would you like your Battleship to be horizontal or vertical? (h/v)"
      if gets.chomp.downcase == 'h'
        bat = Batship.new(true)
      else
        bat = Batship.new
      end

      loop do
        row, col = 0, 0
        puts "\n#{players[x].name}, which row would you like to start your ship placement from?\n"
        row = gets.chomp.to_i-1
        puts "\nAnd which column?"
        col = gets.chomp.to_i-1
        if (0..9).include?(row) && (0..9).include?(col)
          break
        end
      end

      if bat.check_place(grids[x], row: row, col: col)
        bat.place(grids[x], row: row, col: col)
        grids[x].display_hidden
        break
      else
        puts "Invalid placement! Try again.\n"
        sleep (1)
      end
    end

    loop do
      system "clear"
      grids[x].display_hidden
      puts "\n#{players[x].name}, would you like your Destroyer to be horizontal or vertical? (h/v)"
      if gets.chomp.downcase == 'h'
        dest = Destroyer.new(true)
      else
        dest = Destroyer.new
      end

      loop do
        row, col = 0, 0
        puts "\n#{players[x].name}, which row would you like to start your ship placement from?\n"
        row = gets.chomp.to_i-1
        puts "\nAnd which column?"
        col = gets.chomp.to_i-1
        if (0..9).include?(row) && (0..9).include?(col)
          break
        end
      end

      if dest.check_place(grids[x], row: row, col: col)
        dest.place(grids[x], row: row, col: col)
        grids[x].display_hidden
        break
      else
        puts "Invalid placement! Try again.\n"
        sleep (1)
      end
    end

    loop do
      system "clear"
      grids[x].display_hidden
      puts "\n#{players[x].name}, would you like your Submarine to be horizontal or vertical? (h/v)"
      if gets.chomp.downcase == 'h'
        sub = Sub.new(true)
      else
        sub = Sub.new
      end

      loop do
        row, col = 0, 0
        puts "\n#{players[x].name}, which row would you like to start your ship placement from?\n"
        row = gets.chomp.to_i-1
        puts "\nAnd which column?"
        col = gets.chomp.to_i-1
        if (0..9).include?(row) && (0..9).include?(col)
          break
        end
      end

      if sub.check_place(grids[x], row: row, col: col)
        sub.place(grids[x], row: row, col: col)
        grids[x].display_hidden
        break
      else
        puts "Invalid placement! Try again.\n"
        sleep (1)
      end
    end

    loop do
      system "clear"
      grids[x].display_hidden
      puts "\n#{players[x].name}, would you like your Patrolboat to be horizontal or vertical? (h/v)"
      if gets.chomp.downcase == 'h'
        pat = Patrolboat.new(true)
      else
        pat = Patrolboat.new
      end

      loop do
        row, col = 0, 0
        puts "\n#{players[x].name}, which row would you like to start your ship placement from?\n"
        row = gets.chomp.to_i-1
        puts "\nAnd which column?"
        col = gets.chomp.to_i-1
        if (0..9).include?(row) && (0..9).include?(col)
          break
        end
      end

      if pat.check_place(grids[x], row: row, col: col)
        pat.place(grids[x], row: row, col: col)
        system "clear"
        grids[x].display_hidden
        puts "Ship placement complete!"
        sleep (3)
        system "clear"
        break
      else
        puts "Invalid placement! Try again.\n"
        sleep (1)
      end
    end

binding.pry

end

