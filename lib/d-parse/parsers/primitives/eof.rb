module DParse
  module Parsers
    class EOF < DParse::Parser
      def read(input, pos)
        if input.size == pos.index
          Success.new(input, pos)
        else
          Failure.new(input, pos, message: "expected end of input, but found #{display input[pos.index]} at #{pos}")
        end
      end

      def inspect
        'eof()'
      end
    end
  end
end
