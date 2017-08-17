# Write a Towers of Hanoi game.

# Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size.

# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.

# After each move, check to see if they have succeeded in moving all the discs, to the final pile. If so, they win!

class Towers
  attr_reader :towers, :final
  def initialize(discs)
    @towers = { 1 => [], 2 => [], 3 => [] }
    @towers[1] = (1..discs).to_a.reverse
    @final = @towers[1].dup
  end

  def move(from, to)
    if !towers.include?(from)
      puts "Tower #{from} does not exist."
    elsif !towers.include?(to)
      puts "Tower #{to} does not exist."
    elsif from.equal?(to)
      puts "You can't put the same disc where you got it from!"
    elsif towers[to].any? && towers[to].last < towers[from].last
      puts "Invalid move. You can't place a bigger tile on top of a smaller one."
    else
      towers[to] << towers[from].pop
    end
  end

  def over?
    final == towers[2] || final == towers[3]
  end
end


puts "How many discs do you want to play with?"
discs = gets.chomp.to_i
game = Towers.new(discs)

until game.over?
  puts "Here's how the board looks now:"
  game.towers.each do |number, tower|
    puts "Tower #{number}: #{tower}"
  end

  puts "Select the tower you want to move the disc from"
  from = gets.chomp.to_i
  puts "Select the tower you want to move the disc to"
  to = gets.chomp.to_i

  game.move(from, to)
end

puts "Game over! You won!"
