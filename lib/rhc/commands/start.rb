require 'rhc/commands/app'

module RHC::Commands
  class Start < App

    summary "Start the application"
    syntax "<app> [--namespace NAME]"
    takes_application :argument => true

    def run(app)
      self.class.superclass.instance_method(:start).bind(self).call app

      0
    end

  end
end
