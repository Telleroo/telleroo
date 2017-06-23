module Telleroo
  # Client for the Telleroo API
  class Client
    # Define the same set of accessors as the Telleroo module
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Telleroo::Client]
    def initialize(options = {})
      # Merge the config values from the module and those passed
      # to the client.
      merged_options = Telleroo.config.options.merge(options)

      # Copy the merged values to this client and ignore those
      # not part of our configuration
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end

      yield(self) if block_given?
    end
  end
end
