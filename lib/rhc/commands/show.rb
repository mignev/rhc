require 'rhc/commands/app'

module RHC::Commands
  class Show < App

    summary "Show information about an application"
    description <<-DESC
      Display the properties of an application, including its URL, the SSH
      connection string, and the Git remote URL.  Will also display any
      cartridges, their scale, and any values they expose.

      The '--state' option will retrieve information from each cartridge in
      the application, which may include cartridge specific text.

      The '--configuration' option will display configuration values set in
      the application. Use 'rhc configure-app' to configure.

      To see information about the individual gears within an application,
      use '--gears', including whether they are started or stopped and their
      SSH host strings.  Passing '--gears quota' will show the free and maximum
      storage on each gear.

      If you want to run commands against individual gears, use:

        rhc ssh <app> --gears '<command>'

      to run and display the output from each gear.

      DESC
    syntax "<app> [--namespace NAME]"
    takes_application :argument => true
    option ["--state"], "Get the current state of the cartridges in this application"
    option ["--configuration"], "Get the current configuration values set in this application"
    option ["--gears [quota|ssh]"], "Show information about the cartridges on each gear in this application. Pass 'quota' to see per gear disk usage and limits. Pass 'ssh' to print only the SSH connection strings of each gear."

    def run(app_name)
      self.class.superclass.instance_method(:show).bind(self).call app_name

      0
    end

  end
end
