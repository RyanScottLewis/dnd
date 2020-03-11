require "dnd/character/base"

module DND
  module Character
    class V5e < Base

      transform_keys(&:to_sym)

      # Main
      attribute :name,               Types::String.default { "" }
      attribute :player_name,        Types::String.default { "" }
      attribute :character_class,    Types::String.default { "" }
      attribute :background,         Types::String.default { "" }
      attribute :race,               Types::String.default { "" }

      # Characteristics
      attribute :alignment,          Types::String.default { "" }
      attribute :gender,             Types::String.default { "" }
      attribute :eyes,               Types::String.default { "" }
      attribute :size,               Types::String.default { "" }
      attribute :height,             Types::String.default { "" }
      attribute :weight,             Types::String.default { "" }
      attribute :hair,               Types::String.default { "" }
      attribute :skin,               Types::String.default { "" }
      attribute :age,                Types::Coercible::Integer.default(18)

      # Descriptors
      attribute :personality_traits, Types::String.default { "" }
      attribute :ideals,             Types::String.default { "" }
      attribute :bonds,              Types::String.default { "" }
      attribute :flaws,              Types::String.default { "" }
      attribute :appearance,         Types::String.default { "" }
      attribute :allies,             Types::String.default { "" }
      attribute :backstory,          Types::String.default { "" }
      attribute :additional,         Types::String.default { "" }

      # General Statistics
      attribute :speed,              Types::Coercible::Integer.default(0)
      attribute :armor_class,        Types::Coercible::Integer.default(0)
      attribute :proficiency_bonus,  Types::Coercible::Integer.default(2)

      # Primary Statistics
      attribute :stats do
        transform_keys(&:to_sym)

        attribute :strength,           Types::Coercible::Integer.default(0)
        attribute :dexterity,          Types::Coercible::Integer.default(0)
        attribute :intelligence,       Types::Coercible::Integer.default(0)
        attribute :constitution,       Types::Coercible::Integer.default(0)
        attribute :wisdom,             Types::Coercible::Integer.default(0)
        attribute :charisma,           Types::Coercible::Integer.default(0)
      end

      # Stat Modifiers
      attribute :modifiers do
        transform_keys(&:to_sym)

        attribute :strength,           Types::Coercible::Integer.default(0)
        attribute :dexterity,          Types::Coercible::Integer.default(0)
        attribute :constitution,       Types::Coercible::Integer.default(0)
        attribute :intelligence,       Types::Coercible::Integer.default(0)
        attribute :wisdom,             Types::Coercible::Integer.default(0)
        attribute :charisma,           Types::Coercible::Integer.default(0)
      end

      # Saving Throws
      attribute :saving_throws do
        transform_keys(&:to_sym)

        attribute :strength,           Types::Coercible::Integer.default(0)
        attribute :dexterity,          Types::Coercible::Integer.default(0)
        attribute :constitution,       Types::Coercible::Integer.default(0)
        attribute :intelligence,       Types::Coercible::Integer.default(0)
        attribute :wisdom,             Types::Coercible::Integer.default(0)
        attribute :charisma,           Types::Coercible::Integer.default(0)
      end

    end
  end
end
