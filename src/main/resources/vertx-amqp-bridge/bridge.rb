require 'vertx/vertx'
require 'vertx/message_consumer'
require 'vertx/message_producer'
require 'vertx/util/utils.rb'
# Generated from io.vertx.amqp.bridge.Bridge
module VertxAmqpBridge
  #  Vert.x AMQP Bridge. Facilitates sending and receiving AMQP messages.
  class Bridge
    # @private
    # @param j_del [::VertxAmqpBridge::Bridge] the java delegate
    def initialize(j_del)
      @j_del = j_del
    end
    # @private
    # @return [::VertxAmqpBridge::Bridge] the underlying java delegate
    def j_del
      @j_del
    end
    #  Creates a Bridge with the given options.
    # @param [::Vertx::Vertx] vertx the vertx instance to use
    # @param [Hash] options the options
    # @return [::VertxAmqpBridge::Bridge] the (not-yet-started) bridge.
    def self.bridge(vertx=nil,options=nil)
      if vertx.class.method_defined?(:j_del) && !block_given? && options == nil
        return ::Vertx::Util::Utils.safe_create(Java::IoVertxAmqpBridge::Bridge.java_method(:bridge, [Java::IoVertxCore::Vertx.java_class]).call(vertx.j_del),::VertxAmqpBridge::Bridge)
      elsif vertx.class.method_defined?(:j_del) && options.class == Hash && !block_given?
        return ::Vertx::Util::Utils.safe_create(Java::IoVertxAmqpBridge::Bridge.java_method(:bridge, [Java::IoVertxCore::Vertx.java_class,Java::IoVertxAmqpBridge::BridgeOptions.java_class]).call(vertx.j_del,Java::IoVertxAmqpBridge::BridgeOptions.new(::Vertx::Util::Utils.to_json_object(options))),::VertxAmqpBridge::Bridge)
      end
      raise ArgumentError, "Invalid arguments when calling bridge(vertx,options)"
    end
    #  Starts the bridge, establishing the underlying connection.
    # @param [String] hostname the host name to connect to
    # @param [Fixnum] port the port to connect to
    # @param [String] username the username
    # @param [String] password the password
    # @yield the result handler
    # @return [self]
    def start(hostname=nil,port=nil,username=nil,password=nil)
      if hostname.class == String && port.class == Fixnum && block_given? && username == nil && password == nil
        @j_del.java_method(:start, [Java::java.lang.String.java_class,Java::int.java_class,Java::IoVertxCore::Handler.java_class]).call(hostname,port,(Proc.new { |ar| yield(ar.failed ? ar.cause : nil) }))
        return self
      elsif hostname.class == String && port.class == Fixnum && username.class == String && password.class == String && block_given?
        @j_del.java_method(:start, [Java::java.lang.String.java_class,Java::int.java_class,Java::java.lang.String.java_class,Java::java.lang.String.java_class,Java::IoVertxCore::Handler.java_class]).call(hostname,port,username,password,(Proc.new { |ar| yield(ar.failed ? ar.cause : nil) }))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling start(hostname,port,username,password)"
    end
    #  Creates a consumer on the given AMQP address.
    # @param [String] amqpAddress the address to consume from
    # @return [::Vertx::MessageConsumer] the consumer
    def create_consumer(amqpAddress=nil)
      if amqpAddress.class == String && !block_given?
        return ::Vertx::Util::Utils.safe_create(@j_del.java_method(:createConsumer, [Java::java.lang.String.java_class]).call(amqpAddress),::Vertx::MessageConsumer)
      end
      raise ArgumentError, "Invalid arguments when calling create_consumer(amqpAddress)"
    end
    #  Creates a producer to the given AMQP address.
    # @param [String] amqpAddress the address to produce to
    # @return [::Vertx::MessageProducer] the producer
    def create_producer(amqpAddress=nil)
      if amqpAddress.class == String && !block_given?
        return ::Vertx::Util::Utils.safe_create(@j_del.java_method(:createProducer, [Java::java.lang.String.java_class]).call(amqpAddress),::Vertx::MessageProducer)
      end
      raise ArgumentError, "Invalid arguments when calling create_producer(amqpAddress)"
    end
    #  Shuts the bridge down, closing the underlying connection.
    # @yield the result handler
    # @return [self]
    def shutdown
      if block_given?
        @j_del.java_method(:shutdown, [Java::IoVertxCore::Handler.java_class]).call((Proc.new { |ar| yield(ar.failed ? ar.cause : nil) }))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling shutdown()"
    end
  end
end
