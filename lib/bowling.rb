class Bowling

  def score(moves)

    score = strikes_score(moves)
    moves = moves.delete("X")

    score += spares_score(moves)
    moves  = moves.gsub(/\d{1}\//, '')

    moves = moves.gsub("-", "0")
    score += count_hits(moves) unless moves.empty?

    return score

  end

  def spares_score(moves)
    moves.count("/") * 15
  end

  def strikes_score(moves)
    moves.count("X") * 30
  end

  private

    def count_hits(moves)
      moves.chars.collect(&:to_i).inject(&:+)
    end
end

