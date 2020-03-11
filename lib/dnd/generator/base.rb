require "dnd/generator/base"

module DND
  module Generator
    class Base

      def self.call(*arguments)
        new(*arguments).call
      end

      def call
        raise NoMethodError
      end

    end
  end
end

