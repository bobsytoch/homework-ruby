def cut(cake)
  grid = cake.split("\n")
  rows = grid.size
  cols = grid.first.size
  pieces_count = cake.count('o')

  total_cells = rows * cols
  return [] unless (total_cells % pieces_count).zero?

  piece_size = total_cells / pieces_count
  possible_widths = (1..piece_size).select { |w| (piece_size % w).zero? }.reverse

  cuts = []
  marked = Array.new(rows) { Array.new(cols, 0) }

  split_piece = ->(index) do
    return true if index == pieces_count

    start_r = marked.index { |r| r.include?(0) }
    start_c = marked[start_r].index(0)

    possible_widths.each do |w|
      h = piece_size / w
      r_range = start_r...(start_r + h)
      c_range = start_c...(start_c + w)

      next if r_range.end > rows || c_range.end > cols

      segment_marked = marked[r_range].map { |r| r[c_range] }
      segment_grid = grid[r_range].map { |r| r[c_range] }

      next unless segment_marked.flatten.all?(&:zero?)
      next unless segment_grid.flatten.count('o') == 1

      r_range.each { |r| c_range.each { |c| marked[r][c] = index + 1 } }
      cuts << [r_range, c_range]

      return true if split_piece.call(index + 1)

      cuts.pop
      r_range.each { |r| c_range.each { |c| marked[r][c] = 0 } }
    end

    false
  end

  split_piece.call(0)

  cuts.map do |(r_range, c_range)|
    r_range.map { |r| grid[r][c_range] }.join("\n")
  end
end
