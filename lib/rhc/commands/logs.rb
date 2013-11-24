require 'rhc/commands/tail'

module RHC::Commands
  class Logs < Tail

    summary "Tail the logs of an application"
    syntax "<application>"
    takes_application :argument => true
    option ["-o", "--opts options"], "Options to pass to the server-side (linux based) tail command (applicable to tail command only) (-f is implicit.  See the linux tail man page full list of options.) (Ex: --opts '-n 100')"
    option ["-f", "--files files"], "File glob relative to app (default <application_name>/logs/*) (optional)"
    option ["-g", "--gear ID"], "Tail only a specific gear"
    #option ["-c", "--cartridge name"], "Tail only a specific cartridge"
    alias_action :"app tail", :root_command => true, :deprecated => true
    def run(app_name)
      super app_name

      0
    end

  end
end
