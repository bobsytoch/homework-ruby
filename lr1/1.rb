def word_stats(text)
    words = text.split(/\s+/gm)

    count = words.size
    longest = words.max_by(&:length)
    unique = words.map(&:downcase).uniq.size

    puts "#{count} слів, найдовше: #{longest}, унікальних: #{unique}"
end

print "Введіть рядок тексту: "
user_input = gets.chomp

word_stats(user_input)
