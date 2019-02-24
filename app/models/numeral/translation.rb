module Numeral
  class Translation
    class << self
      def init_by_roman(roman)
        Numeral::Roman.new(roman)
      end

      def init_by_intergalactic_expression(expression)
        Numeral::Intergalactic.new(expression)
      end
    end
  end
end

