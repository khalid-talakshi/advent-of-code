require 'set'

module Day03
  class << self
    def part_one(input)
      mapped_input = input.map { |line| line.chars.each_slice(line.length / 2).map(&:join)}
      mapped_same_inputs = mapped_input.map do |line|
        get_intersection(line[0], line[1])
      end
      mapped_priority = mapped_same_inputs.map do |line|
        get_priority(line)
      end
      return mapped_priority.reduce(:+)
    end

    def part_two(input)
      groups = get_groups(input)
      badges = groups.map do |group|
        get_intersection_v2(group[0], group[1], group[2])
      end
      priorities = badges.map do |badge|
        get_priority(badge)
      end
      return priorities.reduce(:+)
    end

    private

    def get_intersection(line1, line2)
      set_line_0 = line1.split("").sort().to_set()
      set_line_1 = line2.split("").sort().to_set()
      intersection = set_line_0.intersection(set_line_1)
      return intersection.to_a[0]
    end

    def get_priority(letter)
      if (/[[:upper:]]/.match(letter))
        return letter.ord - 64 + 26
      else
        return letter.ord - 96
      end
    end

    def get_groups(input)
      input.each_slice(3).to_a
    end

    def get_intersection_v2(line1, line2, line3)
      set_line_0 = line1.split("").sort().to_set()
      set_line_1 = line2.split("").sort().to_set()
      set_line_2 = line3.split("").sort().to_set()
      intersection1 = set_line_0.intersection(set_line_1)
      intersection = intersection1.intersection(set_line_2)
      return intersection.to_a[0]
    end
  end
end
