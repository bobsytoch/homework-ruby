def play_game
  number = rand(1..100)
  attempts = 0

  loop do
    print "введіть число (1-100): "
    guess = gets.to_i
    attempts += 1

    if guess < number
      puts "більше"
    elsif guess > number
      puts "менше"
    else
      puts "вгадано"
      break
    end
  end

  puts "кількість спроб: #{attempts}"
end

play_game
