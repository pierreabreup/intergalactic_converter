module Numeral
  module Validation
    def invalid?
      errors.any?
    end

    def errors
      @errors || []
    end

    def add_error(error_message)
      @errors ||= []
      @errors << error_message
    end
  end
end
