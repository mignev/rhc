require 'rhc/commands/app'

module RHC::Commands
  class Stop < App

    summary "Stop the application"
    syntax "<app> [--namespace NAME]"
    takes_application :argument => true

    def run(app)
      self.class.superclass.instance_method(:stop).bind(self).call app

      0
    end

  end
end
