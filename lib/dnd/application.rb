require "dnd/character/v5e"
require "dnd/generator/character_sheet/v5e"

module DND
  class Application

    def self.call(*arguments)
      new(*arguments).call
    end

    def initialize(arguments)
      @arguments = arguments
    end

    def call
      validate_argument_length
      print_help_if_needed
      parse_arguments
      load_character
      generate_stats
      generate_character
    end

    protected

    def print_help
      puts <<~STR
        Usage: dnd INPUT [OUTPUT] [OPTIONS]

        Generate a DND character.

        Arguments:
            INPUT                 Path to the character input YAML file.
            OUTPUT                Path to the character output YAML file.

            When OUTPUT is omitted, the character is printed to standard output.
            When it is a path with the extension `pdf`, it will generate a PDF character sheet.
            Otherwise, it will save the character to the given path.

        Options:
            -h, --help            Print help message.
      STR
    end

    def error(message)
      puts "Error: #{message}"
      print_help
      exit 1
    end

    def validate_argument_length
      if @arguments.size == 0 || @arguments.size > 2
        error "Incorrect arguments given"
      end
    end

    def print_help_if_needed
      return unless @arguments.any? { |argument| argument =~ /^(-h|--help)$/i }

      print_help
      exit
    end

    def parse_arguments
      @path   = File.expand_path(@arguments[0])
      @output = @arguments[1]
    end

    def load_character
      error "Input path does not exist" unless File.exists?(@path)
      @character = Character::V5e.load_file(@path)
      error "Invalid character input file" if @character.nil?
    end

    def generate_stats
      # TODO: Fill out missing stats from known stats, print an error if it cant
      # Maybe ask for missing stats?
      # If thats the case then INPUT argument can be optional
    end

    def generate_character

      if @output.nil?
        puts @character.to_yaml
      else
        print "Outputting to '#{@output}' as "
        if File.extname(@output).downcase == ".pdf"
          puts "PDF"
          Generator::CharacterSheet::V5e.call(@character, @output)
        else
          puts "YAML"
          # TODO: Ask to overwrite if file exists?
          File.open(@output, "w+") do |io|
            io.write(@character.to_yaml)
          end
        end
      end
    end

  end
end

