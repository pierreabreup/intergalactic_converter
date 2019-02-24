module Numeral
  class Roman
    include Validation

    def initialize(number)
      @number = number

      validate
    end

    def to_arabic
      values = []
      index = 0

      while number[index]
        current_value = symbol_values[number[index]]
        next_value    = number[index+1] ? symbol_values[number[index+1]] : 0

        if current_value < next_value
          values << (next_value - current_value)
          index +=2
        else
          values << current_value
          index +=1
        end
      end

      values.inject(:+)
    end

    private

    def number
      @number
    end

    def symbol_values
      ::Application.settings.numerals.roman.symbol_values
    end

    def validate
      check_repeated_only_three_times_in_succession
      check_can_never_be_repeated_in_succession
      check_invalid_subtraction
    end

    def check_repeated_only_three_times_in_succession
      check_invalid_repetition_in_succession(
        invalid_repetation_number: 4,
        message: "The symbol %s can only be repeated three times in succession.",
        symbols: ['I', 'X', 'C', 'M']
      )
    end

    def check_can_never_be_repeated_in_succession
      check_invalid_repetition_in_succession(
        invalid_repetation_number: 2,
        message: "The symbol %s can never be repeated in succession.",
        symbols: ['D', 'L', 'V']
      )
    end

    def check_invalid_repetition_in_succession(options)
      invalid_repetation_number = options.delete :invalid_repetation_number
      symbols = options.delete :symbols
      message = options.delete :message

      symbols.each do |symbol|
        if number.match(symbol * invalid_repetation_number)
          add_error(message % symbol)
        end
      end
    end

    def check_invalid_subtraction
      invalids = ['DM']
      invalids.concat(['L','C','D','M'].map {|s| 'I' + s})
      invalids.concat(['D','M'].map {|s| 'X' + s})
      invalids.concat(['X','L','C','D','M'].map {|s| 'V' + s})
      invalids.concat(['C','D','M'].map {|s| 'L' + s})

      invalids.each do |sub|
        if number.match(sub)
          add_error("#{sub} is a invalid subtraction")
        end
      end

      check_on_small_may_by_subtracted_from_large
    end

    def check_on_small_may_by_subtracted_from_large
      previous_symbols = []
      invalid_repetation_number = 2
      symbol_values.values.sort.each do |symbol_value|
        symbol = symbol_values.key(symbol_value)
        if previous_symbols.any?
          previous_symbols.each do |previous|
            invalid = (previous * invalid_repetation_number) + symbol
            if number.match(invalid)
              add_error("#{invalid} is a invalid subtraction")
            end
          end
        end
        previous_symbols << symbol
      end
    end

  end
end
