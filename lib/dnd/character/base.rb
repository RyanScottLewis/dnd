require "dnd/types"

module DND
  module Character
    class Base < Dry::Struct

      def self.load_file(path)
        new(YAML.load_file(path))
      rescue Psych::SyntaxError, Dry::Struct::Error
        nil
      end

      def to_h
        stringify_keys(super)
      end

      def to_yaml
        to_h.to_yaml
      end

      protected

      def stringify_keys(object)
        case object
        when Hash
          object.transform_keys(&:to_s).transform_values { |val| stringify_keys(val) }
        else
          object
        end
      end

    end
  end
end

