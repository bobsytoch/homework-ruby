def word_stats(text)
    words = text.split(/\s+/)

    count = words.size
    longest = words.max_by(&:length)
    unique = words.map(&:downcase).uniq.size

    puts "#{count} слів, найдовше: #{longest}, унікальних: #{unique}"
end

print "введіть рядок: "
word_stats(gets.chomp)
