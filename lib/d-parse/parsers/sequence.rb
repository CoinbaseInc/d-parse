module DParse
  module Parsers
    class Sequence < DParse::Parser
      def initialize(*parsers)
        @parsers = parsers
      end

      def read(input, pos)
        @parsers.reduce(Success.new(pos)) do |res, parser|
          case res
          when Success
            parser.read(input, res.pos).map { |d| res.data + [d] }
          when Failure
            res
          end
        end
      end

      def inspect
        "seq(#{@parsers.map(&:inspect).join(',')})"
      end
    end
  end
end
