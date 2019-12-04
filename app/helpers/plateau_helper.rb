# frozen_string_literal: true

module PlateauHelper
  def sides_select
    %i[north east south west].map do |side|
      [t("plateau.sides.#{side}"), side]
    end
  end
end
