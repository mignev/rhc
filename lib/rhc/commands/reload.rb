require 'rhc/commands/app'

module RHC::Commands
  class Reload < App

    summary "Reload the application's configuration"
    syntax "<app> [--namespace NAME]"
    takes_application :argument => true

    def run(app)
      self.class.superclass.instance_method(:reload).bind(self).call app

      0
    end

  end
end
