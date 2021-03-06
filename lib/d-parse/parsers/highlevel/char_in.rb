module DParse
  module Parsers
    class CharIn < DParse::Parser
      def self.new(chars)
        DParse::Parsers::Alt.new(*chars.map { |c| DParse::Parsers::Char.new(c) })
      end

      def initialize(*)
        raise ArgumentError, "#{self.class} is not supposed to be initialized"
      end
    end
  end
end
