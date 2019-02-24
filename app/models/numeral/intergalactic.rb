module Numeral
  class Intergalactic
    include Validation

    def initialize(expression)
      @expression = expression

      validate
    end

    def to_roman
      expression.split(' ').map {|term| symbol_values[term]}.join
    end

    private

    def expression
      @expression
    end

    def symbol_values
      ::Application.settings.numerals.intergalactic.symbol_values
    end

    def validate
      check_accepted_terms
    end

    def check_accepted_terms
      expression.split(' ').each do |term|
        unless symbol_values.has_key?(term)
          add_error("'#{term}' is a invalid term. The following terms accepted only: #{symbol_values.keys.join(', ')}")
        end
      end
    end
  end
end
