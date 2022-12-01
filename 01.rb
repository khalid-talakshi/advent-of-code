module Day01
  class << self
    def part_one(input)
      cal_count = sorted_elf_cals(input)
      largest_cal = cal_count.first
    end

    def part_two(input)
      cal_count = sorted_elf_cals(input)
      top_3_cal = cal_count.first(3)
      sum_top_3_cal = top_3_cal.reduce(:+)
    end

    def sorted_elf_cals(input)
      sum = 0
      arr = []
      input.each do |cal|
        if cal == ""
          arr.push(sum)
          sum = 0
        else
          sum += cal.to_i
        end
      end
      sorted_arr = arr.sort { |a, b| b <=> a }
      return sorted_arr
    end
  end
end
