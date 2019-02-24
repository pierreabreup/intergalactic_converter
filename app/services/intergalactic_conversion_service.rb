class IntergalacticConversionService
  def initialize(expression)
    @expression = expression
  end

  def credits
    words = expression.strip.split(' ')
    unit_as_arabic_number = 1
    if unit?(words.last)
      unit_as_arabic_number = units[words.pop]
    end

    intergalactic_numeral = Numeral::Translation.init_by_intergalactic_expression(words.join(' '))
    if intergalactic_numeral.invalid?
      raise ConversionFailureError.new(intergalactic_numeral.errors)
    end
    roman = intergalactic_numeral.to_roman
    Numeral::Translation.init_by_roman(roman).to_arabic * unit_as_arabic_number
  end

  private

  def expression
    @expression.downcase
  end

  def unit?(word)
    units.key?(word)
  end

  def units
    ::Application.settings.units.intergalactic.glob
  end
end
