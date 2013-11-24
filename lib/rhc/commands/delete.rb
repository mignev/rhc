require 'rhc/commands/app'

module RHC::Commands
  class Delete < App
    summary "Delete an application from the server"
    description "Deletes your application and all of its data from the server.",
                "Use with caution as this operation is permanent."
    syntax "<app> [--namespace NAME]"
    takes_application :argument => true
    option ["--confirm"], "Pass to confirm deleting the application"

    def run(app)
      self.class.superclass.instance_method(:delete).bind(self).call app

      0
    end

  end
end
