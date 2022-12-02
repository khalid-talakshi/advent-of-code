module Day02
  class << self
    Round = Struct.new(:op_hand, :p_hand) do
      def score
        sum = 0
        # sum += hand_to_score(op_hand)
        sum += hand_to_score(p_hand)
        sum += outcome_to_score()
        return sum
      end

      def hand_to_score(hand)
        if hand == :rock
          return ROCK_SCORE
        elsif hand == :paper
          return PAPER_SCORE
        else
          return SCISSORS_SCORE
        end
      end

      def outcome_to_score
        if op_hand == p_hand
          return 3
        elsif op_hand == :rock && p_hand == :paper ||
          op_hand == :paper && p_hand == :scissors ||
          op_hand == :scissors && p_hand == :rock
          return 6
        else
          return 0
        end
      end
    end
    ROCK_SCORE = 1
    PAPER_SCORE = 2
    SCISSORS_SCORE = 3
    LOSE_SCORE = 0
    TIE_SCORE = 3
    WIN_SCORE = 6

    def part_one(input)
      rounds = input_to_rounds(input)
      scores = rounds_to_scores(rounds)
      final_score = scores.reduce(:+)
      return final_score
    end

    def part_two(input)
      rounds = input_to_rounds_v2(input)
      scores = rounds_to_scores(rounds)
      final_score = scores.reduce(:+)
      return final_score
    end

    private
    def input_to_rounds(input)
      input.map do |line|
        op_hand = nil
        p_hand = nil
        line.split(" ").map do |hand|
          case hand
            when "A"
              op_hand = :rock
            when "B"
              op_hand = :paper
            when "C"
              op_hand = :scissors
            when "X"
              p_hand = :rock
            when "Y"
              p_hand = :paper
            when "Z"
              p_hand = :scissors
          end
        end
        Round.new(op_hand, p_hand)
      end
    end

    def hand_to_make(op_hand, expected_outcome)
      hands = [:rock, :paper, :scissors]
      if expected_outcome == :draw
        return op_hand
      elsif expected_outcome == :win
        idx = (hands.find_index(op_hand) + 1) % 3
        return hands[idx]
      else
        idx = (hands.find_index(op_hand) - 1) % 3
        return hands[idx]
      end
    end

    def input_to_rounds_v2(input)
      input.map do |line|
        op_hand = nil
        p_hand = nil
        line.split(" ").map do |hand|
          case hand
            when "A"
              op_hand = :rock
            when "B"
              op_hand = :paper
            when "C"
              op_hand = :scissors
            when "X"
              p_hand = hand_to_make(op_hand, :lose)
            when "Y"
              p_hand = hand_to_make(op_hand, :draw)
            when "Z"
              p_hand = hand_to_make(op_hand, :win)
          end
        end
        Round.new(op_hand, p_hand)
      end
    end

    def rounds_to_scores(rounds)
      return rounds.map do |round|
        round.score
      end
    end
  end
end
