require 'rhc/commands/app'

module RHC::Commands
  class ForceStop < App

    summary "Stops all application processes"
    syntax "<app> [--namespace NAME]"
    takes_application :argument => true

    def run(app)
      self.class.superclass.instance_method(:force_stop).bind(self).call app

      0
    end

  end
end
