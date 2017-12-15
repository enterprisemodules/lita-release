module Lita
  module Handlers
    class Release < Handler
      Lita.register_handler(self)

      help_text = <<~HELP
      Use release with a module you want to release. Here is an example:
      
        release ora_config

      This command will build a new release of the ora_config module and pubish
      it on ALL known channels.
      HELP

      route(/release\s+(.+)/, :release,
            command: true,
            # restrict_to: [:module_developers],
            help: {'release': help_text})

      def release(response)
        module_name = response.args[0]
        response.reply "You have just released module #{module_name}"
      end

    end
  end
end
