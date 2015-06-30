module PlateauHelper
  def sides_select
    [:north, :east, :south, :west].map do |side|
      [t("plateau.sides.#{side}"), side]
    end
  end
end
