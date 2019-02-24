require 'choices'
require 'pathname'

class Application
  class << self
    def settings
      @@settings ||= Choices.load_settings(File.join(Dir.pwd, 'config','settings.yml'),ENV['APP_ENVIRONMENT_NAME'])
    end
  end

  def run
    console = CommandLineInput.new

    while console.listening?
      begin
        console.output(IntergalacticConversionService.new(console.input).credits)
      rescue ConversionFailureError => e
        console.output("ERRORS: ")
        console.output(' ' + e.message)
      end
    end
  end
end
