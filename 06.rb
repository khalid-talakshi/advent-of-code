module Day06
  class << self
    def part_one(input)
      find_marker(input, 4)
    end

    def part_two(input)
      find_marker(input, 14)
    end

    def find_marker(input, length)
      buffer = input[0].chars
      buffer.length().times do |i|
        marker = buffer[i..i + (length - 1)]
        if (marker.uniq == marker)
          return i + length
        end
      end
    end
  end
end
