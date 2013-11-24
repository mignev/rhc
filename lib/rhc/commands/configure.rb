require 'rhc/commands/app'

module RHC::Commands
  class Configure < App
    summary "Configure several properties that apply to an application"
    syntax "<app> [--[no-]auto-deploy] [--keep-deployments INTEGER] [--deployment-branch BRANCH] [--deployment-type TYPE] [--namespace NAME]"
    takes_application :argument => true
    option ["--[no-]auto-deploy"], "Build and deploy automatically when pushing to the git repo. Defaults to true."
    option ["--keep-deployments INTEGER", Integer], "Number of deployments to preserve. Defaults to 1."
    option ["--deployment-branch BRANCH"], "Which branch should trigger an automatic deployment, if automatic deployment is enabled with --auto-deploy. Defaults to master."
    option ["--deployment-type git|binary"], "Type of deployment the application accepts ('git' or 'binary'). Defaults to git."

    def run(app_name)
      self.class.superclass.instance_method(:configure).bind(self).call app_name

      0
    end

  end
end
