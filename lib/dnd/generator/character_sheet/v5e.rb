require "dnd/generator/character_sheet/base"

module DND
  module Generator
    module CharacterSheet
      class V5e < Base

        FONT_SIZES = {
          tiny: 6,
          small: 8,
          medium: 10,
          large: 12,
          extra_large: 16,
          huge: 18,
        }

        def generate
          half    = bounds.right / 2
          quarter = bounds.right / 4
          sixth   = bounds.right / 6

          form_input x: 0,              width: half + quarter, label: "Character Name", text: @character.name, text_size: :extra_large
          form_input x: half + quarter, width: quarter,        label: "Player Name", text: @character.player_name, text_size: :extra_large

          # Characteristics
          y = 40
          form_input x: sixth * 0, y: y, width: sixth, label: "Class", text: @character.character_class
          form_input x: sixth * 1, y: y, width: sixth, label: "Background", text: @character.background
          form_input x: sixth * 2, y: y, width: sixth, label: "Race", text: @character.race
          form_input x: sixth * 3, y: y, width: sixth, label: "Alignment", text: @character.alignment
          form_input x: sixth * 4, y: y, width: sixth, label: "Gender", text: @character.gender
          form_input x: sixth * 5, y: y, width: sixth, label: "Eyes", text: @character.eyes

          y = 70
          form_input x: sixth * 0, y: y, width: sixth, label: "Size", text: @character.size
          form_input x: sixth * 1, y: y, width: sixth, label: "Height", text: @character.height
          form_input x: sixth * 2, y: y, width: sixth, label: "Weight", text: @character.weight
          form_input x: sixth * 3, y: y, width: sixth, label: "Hair", text: @character.hair
          form_input x: sixth * 4, y: y, width: sixth, label: "Skin", text: @character.skin
          form_input x: sixth * 5, y: y, width: sixth, label: "Age", text: @character.age.to_s

          # Stats
          y = 110
          height = 50
          width = 50
          stat(x: 0, y: y + (height * 0) + (5 * 0), width: width, height: height, label: "Strength", stat: @character.stats.strength, modifier: @character.modifiers.strength)
          stat(x: 0, y: y + (height * 1) + (5 * 1), width: width, height: height, label: "Dexterity", stat: @character.stats.dexterity, modifier: @character.modifiers.dexterity)
          stat(x: 0, y: y + (height * 2) + (5 * 2), width: width, height: height, label: "Constitution", stat: @character.stats.constitution, modifier: @character.modifiers.constitution)
          stat(x: 0, y: y + (height * 3) + (5 * 3), width: width, height: height, label: "Intelligence", stat: @character.stats.intelligence, modifier: @character.modifiers.intelligence)
          stat(x: 0, y: y + (height * 4) + (5 * 4), width: width, height: height, label: "Wisdom", stat: @character.stats.wisdom, modifier: @character.modifiers.wisdom)
          stat(x: 0, y: y + (height * 5) + (5 * 5), width: width, height: height, label: "Charisma", stat: @character.stats.charisma, modifier: @character.modifiers.charisma)

          # Saving Throws
        end

        def form_input(label: "", text: "", x: 0, y: 0, label_size: :small, text_size: :medium, width: 200, label_margin: 2, text_margin: 2)
          x            = bounds.left + x
          y            = bounds.top - y
          text_size    = text_size.is_a?(Symbol) ? FONT_SIZES[text_size] : text_size.to_i
          label_size   = label_size.is_a?(Symbol) ? FONT_SIZES[label_size] : label_size.to_i
          text_height  = height_of(text, size: text_size)
          label_height = height_of(label, size: label_size)

          text_width = width_of(text, size: text_size)
          while text_width > width
            text_size -= 1
            text_width = width_of(text, size: text_size)
          end

          label_width = width_of(label, size: label_size)
          while label_width > width
            label_size -= 1
            label_width = width_of(label, size: label_size)
          end

          draw_text text, at: [x + text_margin, y - text_height + text_margin], size: text_size

          stroke do
            line [x, y - text_height - text_margin], [x + width, y - text_height - text_margin]
          end

          draw_text label, at: [x + label_margin, y - text_height - label_height - label_margin], size: label_size
        end

        def stat(x: 0, y: 0, width:, height:, label: "", stat: 0, modifier: 0, label_size: :small, modifier_size: :extra_large, stat_size: :medium)
          x            = bounds.left + x
          y            = bounds.top - y
          label_size   = label_size.is_a?(Symbol) ? FONT_SIZES[label_size] : label_size.to_i

          label_width = width_of(label, size: label_size)
          while label_width > width
            label_size -= 1
            label_width = width_of(label, size: label_size)
          end
          label_height = height_of(label, size: label_size)

          stroke do
            rounded_rectangle [x, y], width, height, 5
          end

          draw_text label, at: [x + (width / 2) - (label_width / 2), y - label_height], size: label_size

          modifier_size   = modifier_size.is_a?(Symbol) ? FONT_SIZES[modifier_size] : modifier_size.to_i
          modifier_text   = modifier < 0 ? modifier.to_s : "+#{modifier}"
          modifier_width  = width_of(modifier_text, size: modifier_size)
          modifier_height = height_of(modifier_text, size: modifier_size)
          draw_text modifier_text, at: [x + (width / 2) - (modifier_width / 2), y - (height / 2) - (modifier_height / 2) + 5], size: modifier_size

          stat_size   = stat_size.is_a?(Symbol) ? FONT_SIZES[stat_size] : stat_size.to_i
          stat_text   = stat.to_s
          stat_width  = width_of(stat_text, size: stat_size)
          stat_height = height_of(stat_text, size: stat_size)
          draw_text stat_text, at: [x + (width / 2) - (stat_width / 2), y - height + 4], size: stat_size
        end

      end
    end
  end
end

