require 'rhc/commands/app'

module RHC::Commands
  class Restart < App

    summary "Restart the application"
    syntax "<app> [--namespace NAME]"
    takes_application :argument => true

    def run(app)
      self.class.superclass.instance_method(:restart).bind(self).call app

      0
    end

  end
end
