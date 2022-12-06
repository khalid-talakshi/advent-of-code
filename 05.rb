module Day05
  class << self
    def part_one(input)
      stacks = create_stacks(input)
      instructions = create_instructions(input)
      return move_crates(stacks, instructions)
    end

    def part_two(input)
      stacks = create_stacks(input)
      instructions = create_instructions(input)
      return move_multiple_crates(stacks, instructions)
    end

    private

    def create_stacks(input)
      pivot = input.find_index("")
      stacks_input = input[0..pivot - 1]
      stack_arrs = input[pivot - 1]
      stack_arrs_input = read_line(stack_arrs)
      stacks = stack_arrs_input.map do
        []
      end

      stacks_crates = stacks_input[0..stacks_input.length() - 2]
      parsed_stacks_crates = stacks_crates.map do |line|
        crates = read_line(line)
      end
      parsed_stacks_crates.each do |line|
        line.each_with_index do |crate, i|
          stacks[i].unshift(crate) unless crate == " "
        end
      end
      return stacks
    end

    def read_line(str)
      str_arr = str.chars
      counter = 1
      result = []
      while counter < str_arr.length()
        result.push(str_arr[counter])
        counter += 4
      end
      return result
    end

    def create_instructions(input)
      pivot = input.find_index("")
      instructions_input = input[pivot + 1..]
      cleaned_instructions = instructions_input.map do |line|
        sub_arr = line.split(" ")
        sub_arr.delete("move")
        sub_arr.delete("from")
        sub_arr.delete("to")
        int_sub_arr = sub_arr.map { |i| i.to_i }
        int_sub_arr
      end
      return cleaned_instructions
    end

    def move_crates(stacks, instructions)
      instructions.each do |set|
        quantity = set[0]
        origin = set[1] - 1
        dest = set[2] - 1
        for i in 1..quantity
          crate = stacks[origin].pop()
          stacks[dest].push(crate)
        end
      end
      get_result(stacks)
    end

    def move_multiple_crates(stacks, instructions)
      instructions.each do |set|
        quantity = set[0]
        origin = set[1] - 1
        dest = set[2] - 1
        crane = []
        for i in 1..quantity
          crane.push(stacks[origin].pop())
        end
        stacks[dest].concat(crane.reverse())
        crane = []
      end
      return get_result(stacks)
    end

    def get_result(stacks)
      str = ""
      stacks.each do |stack|
        str += stack.pop()
      end
      return str
    end
  end
end
