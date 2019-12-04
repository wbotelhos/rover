# frozen_string_literal: true

require 'rails_helper'

describe PlateauHelper do
  describe '#sides_select' do
    it 'builds a select option with name and id ordered by name' do
      expect(helper.sides_select).to eq [
        [I18n.t('plateau.sides.north'), :north],
        [I18n.t('plateau.sides.east'), :east],
        [I18n.t('plateau.sides.south'), :south],
        [I18n.t('plateau.sides.west'), :west],
      ]
    end
  end
end
