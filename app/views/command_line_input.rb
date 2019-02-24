class CommandLineInput
  attr_reader :input

  def initialize
    instructions


  end

  def listening?
    puts 'Type the unit or type EXIT to close the program:'
    @input = sanitize_string(gets.chomp)

    !@input.eql?('EXIT')
  end

  def output(message)
    puts(" -> #{message}")
  end

  def instructions
    puts "-------------------------------------------------------------------------"
    puts "|            Deep Thought: Intergalactic unit conversor                 |"
    puts "-------------------------------------------------------------------------"
    puts "Type bellow a intergalactic units (For example: glob glob Silver) and to find how many credits is it. After type, press [Enter] button in your keyboard."
    puts "\n"
    puts "\n"
  end

  private

  def sanitize_string(str)
    str.squeeze.gsub(/^[^a-z]*([a-z\s]*[a-z]+)[^a-z]*$/, '\1')
  end

end
