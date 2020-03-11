require "dnd/generator/base"

module DND
  module Generator
    module CharacterSheet
      class Base < Generator::Base # TODO: Should prolly be more of a PDF generator

        def initialize(character, path)
          @character = character
          @path      = path
          @document  = Prawn::Document.new(margin: [10, 10, 10, 10])
        end

        def call
          generate
          save
        end

        def generate
          raise NoMethodError
        end

        def method_missing(method, *arguments, &block)
          @document.send(method, *arguments, &block)
        end

        protected

        def save
          @document.render_file(@path)
        end

      end
    end
  end
end

