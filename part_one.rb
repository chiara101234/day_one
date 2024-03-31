class Main
end

class Challenge
  attr_accessor :nums
  DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize(a_file)
    @nums = []
    process(a_file)
  end

  def process(file_name)
    File.open(file_name, 'r') do |file|
      while (line = file.gets)
      value = ""
      is_digit = false
      for i in 0...line.size
        for j in 0...DIGITS.size
        next if (line[i] != DIGITS[j].to_s)
          is_digit = true
        end
        if (is_digit)
          value << line[i]
          #puts value
        end
        is_digit = false;
      end
      val_siz = value.size
      value = value[0] << value[val_siz-1]
      @nums << value.to_i
      value = ""
    end
    end
  end

  def printing
    for i in 0...@nums.size
      puts @nums[i]
    end
  end

  def count
    total = 0;
    for i in 0...@nums.size
      total += nums[i]
    end
    return total
  end


end

if __FILE__ == $0
  my_challenge = Challenge.new("challenge.txt")
  #my_challenge.printing
  puts "The total from the input file is: " + my_challenge.count.to_s
end
