require 'rhc/commands/base'

module RHC::Commands
  class Apps < Base
    summary "List all your applications"
    description "Display the list of applications that you own. Includes information about each application."
    def run
      applications = rest_client.applications(:include => :cartridges).sort

      info "In order to deploy applications, you must create a domain with 'app setup' or 'app create-domain'." and return 1 if applications.empty? && rest_client.domains.empty?

      applications.each{ |a| display_app(a, a.cartridges) }.blank? and
        info "No applications. Use 'app create-app'." and
        return 1

      success "You have #{applications.length} applications"
      0
    end
  end
end
