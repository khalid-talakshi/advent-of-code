module Day04
  class << self
    def part_one(input)
      ranges = input.map { |line| line.split(",").map { |i| i.split("-").map(&:to_i) } }
      contains_map = ranges.map do |range|
        contains(range)
      end
      return contains_map.count(true)
    end

    def part_two(input)
      ranges = input.map { |line| line.split(",").map { |i| i.split("-").map(&:to_i) } }
      contains_map = ranges.map do |range|
        contains(range) || overlaps(range)
      end
      return contains_map.count(true)
    end

    def contains(ranges)
      elf1_range0 = ranges[0][0]
      elf1_range1 = ranges[0][1]
      elf2_range0 = ranges[1][0]
      elf2_range1 = ranges[1][1]

      if (elf1_range0 <= elf2_range0 && elf1_range1 >= elf2_range1)
        return true
      elsif (elf1_range0 >= elf2_range0 && elf1_range1 <= elf2_range1)
        return true
      else
        return false
      end
    end

    def overlaps(ranges)
      elf1_range0 = ranges[0][0]
      elf1_range1 = ranges[0][1]
      elf2_range0 = ranges[1][0]
      elf2_range1 = ranges[1][1]
      if (elf1_range1 < elf2_range0 || elf1_range0 > elf2_range1)
        return false
      else
        return true
      end
    end
  end
end
