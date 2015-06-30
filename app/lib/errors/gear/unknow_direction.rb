module Errors
  module Gear
    class UnknowDirection < StandardError
      def initialize(direction)
        @direction = direction
      end

      def to_s
        "Cannot turn to unknow '#{@direction}' direction."
      end
    end
  end
end
