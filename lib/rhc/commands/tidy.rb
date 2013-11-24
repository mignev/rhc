require 'rhc/commands/app'

module RHC::Commands
  class Tidy < App

    summary "Clean out the application's logs and tmp directories and tidy up the git repo on the server"
    syntax "<app> [--namespace NAME]"
    takes_application :argument => true

    def run(app)
      self.class.superclass.instance_method(:tidy).bind(self).call app

      0
    end

  end
end
