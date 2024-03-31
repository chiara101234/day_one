class Main
end

class Challenge
  attr_accessor :nums

  DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  NUMS = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]

  def initialize(a_file, file_two)
    @nums = []
    process(a_file, file_two)
  end

  def process(file_name, file_two_name)
    File.open(file_name, 'r') do |file|
      while (line = file.gets)
        value = ""
        is_digit = false
        is_number = false
        collect = 0;
        for i in 0...line.size
          #puts "Current line: " + line
          for j in 0...DIGITS.size
             if line[i] == DIGITS[j].to_s
               is_digit = true
             elsif line[i] != DIGITS[j].to_s
                 for k in 0... NUMS.size
                    search_length = NUMS[k].length-1
                    #puts "PAY ATTENTION:    " + NUMS[k] + " uhh " + line[i..(i+ search_length)]
                   if (line[i..(i + search_length)] == NUMS[k])
                     collect = k+1
                    #puts "SUCCESSSSSSS"
                     #puts "line 34:  " + value
                     is_number = true
                    break
                   end
                 
             end
          end
          end
          if is_digit == true
            value << line[i]
            #puts "Just added: " + line[i]
          elsif is_number == true
            value << collect.to_s
            #puts "JJust added: " + collect.to_s
          end
          
          #reset variables
          collect = 0;
          is_digit = false
          is_number = false
          #puts "CURRENT VALUE: " + value

         
          
        end
        val_siz = value.size
        value = value[0].to_s + value[val_siz-1].to_s
        #puts "new val: " + value
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
    total = 0
    for i in 0...@nums.size
      total += nums[i]
    end
    total
  end
end

if __FILE__ == $0
  my_challenge = Challenge.new('challenge.txt', 'nums.txt')
  #my_challenge.printing
  puts 'The total from the input file is: ' +       my_challenge.count.to_s
end
