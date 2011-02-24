class Cache
  # Here's where config options are kept.
  #
  # Example:
  #     cache.config.default_ttl = 120 # seconds
  class Config
    
    attr_reader :parent
    
    def initialize(parent) #:nodoc:
      @parent = parent
    end
    
    # The cache client to use.
    #
    # Note that you normally just set this when you initialize a Cache object.
    #
    # Example:
    #     cache.config.client = Memcached.new '127.0.0.1:11211'
    def client=(client) #:nodoc:
      @client = client
    end

    def client #:nodoc:
      if @client.nil?
        require 'active_support/cache'
        require 'active_support/cache/memory_store'
        @client = ::ActiveSupport::Cache::MemoryStore.new
      else
        @client
      end
    end
    
    # TTL for method caches. Defaults to 60 seconds.
    #
    # Example:
    #     cache.config.default_ttl = 120 # seconds
    def default_ttl=(seconds)
      @default_ttl = seconds
    end
    
    def default_ttl #:nodoc:
      @default_ttl || 60
    end
  end
end
